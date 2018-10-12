package org.kosta.inssaground.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.inssaground.model.service.MemberService;
import org.kosta.inssaground.model.vo.MemberVO;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class MemberAuthenticationProvider implements AuthenticationProvider{
	@Resource
	private MemberService memberService;
	//비밀번호 암호화처리를 위한 객체를 주입받는다 
	@Resource
    private BCryptPasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {		
		//1.파라미터로 전달받은 Authentication 객체에 대해 인증처리를 지원하지 않으면 null을 리턴한다.
				if(!supports(authentication.getClass())){
					return null;
				}
				//2.사용자 정보 DB로부터 조회
				String id = authentication.getName();//사용자가 로그인시 입력한 ID 반환 		
				System.out.println(id);
				MemberVO member = memberService.findMemberById(id);
				System.out.println(member);
				if(member == null){
					throw new UsernameNotFoundException("회원 아이디가 존재하지 않습니다");
				}
				
				String password=(String)authentication.getCredentials();//사용자가 입력한 패스워드 반환 
				//3.패스워드 비교
				if(!password.equals(member.getPassword())){//패스워드가 틀리면
					throw new BadCredentialsException("패스워드가 틀립니다.");
				}
				/* 비밀번호 암호화를 이용할 경우 
				 이용자가 로그인 폼에서 입력한 비밀번호와 DB로부터 가져온 암호화된 비밀번호를 비교한다 */
		        /*if (!passwordEncoder.matches(password, member.getPassword())) 
		                throw new BadCredentialsException("비밀번호 불일치~~~");*/
				//4.사용자 권한 조회
				List<String> list = memberService.selectAuthorityById(id);
				if(list.size() == 0){
					throw new UsernameNotFoundException("아무 권한이 없습니다.");
				}
				
				List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();		
				for(String au : list){ // ROLE_ 형식의 db 정보가 아니라면 이 시점에 ROLE_ 를 접두어로 추가한다
					authorities.add(new SimpleGrantedAuthority(au));
					System.out.println(au);
				}
				/****************************************
				 * 여기까지 왔으면 인증 완료 - Authentication객체 생성해서 리턴
				 ***************************************/
				
				Authentication auth = new UsernamePasswordAuthenticationToken(member, password, authorities);
				System.out.println("로그인 OK~"+auth);
				return auth;	
	}

	@Override
	public boolean supports(Class<?> authentication) {
		//return  UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
		//현재 MemberAuthenticationProvider가  지정된 Authentication 객체를 지원하면 true를 반환한다  
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
}
