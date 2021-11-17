package com.theantiquersroom.myapp.service;


import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.theantiquersroom.myapp.domain.LoginDTO;
import com.theantiquersroom.myapp.domain.MypageCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.domain.UserVO;
import com.theantiquersroom.myapp.domain.modifyDTO;
import com.theantiquersroom.myapp.mapper.UserMapper;
import com.theantiquersroom.myapp.utils.Mailsender;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@AllArgsConstructor
@Log4j2

@Service
public class UserServiceImpl implements UserService, InitializingBean, DisposableBean{


    @Setter(onMethod_= {@Autowired})
    private Mailsender mailsender;
    private UserMapper mapper;
    private BCryptPasswordEncoder passwordEncoder;

    
    // DB에 회원정보 저장
    @Override
    public boolean registerUser(UserDTO user) {
        log.debug("login({}) invoked.", user);

        Integer users = null;
        
        users = mapper.insertUser(user);
        
        // 비밀번호 암호화
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        int affectedRows = this.mapper.insertUser(user);

        return affectedRows > 0;
    }

    @Override
    public boolean checkId(String userId) {
    	log.debug("checkId({}) invoked.", userId);
    	
    	String id = "";
    	
    	id = mapper.getUserId(userId);
    	
    	log.debug(id);
    	
    	if(id != null) {
    		return true;
    	}else {
    		return false;
    	}
    }

    @Override
    public boolean checkNickName(String nickName) {
    	log.debug("checkNickName({}) invoked.", nickName);
    	
    	String nName = "";
    	
    	nName = mapper.getNickName(nickName);
    	log.debug("닉네임 from controller ({})", nickName);
    	
    	if(nName != null) {
    		return true;
    	}else {
    		return false;
    	}
    }

    @Override
    public boolean checkPhone(String phone) {

    	String pNum = "";
    	
    	pNum = mapper.getPhone(phone);
    	
    	if(pNum != null) {
    		return true;
    	}else {
    		return false;
    	}
    }

    @Override
    public boolean confirmEmail(String userId, String auth) throws ParseException {

        log.debug("confirmEmail invoked userId : {} auth : {}",userId,auth);

        //DB Auth값 조회
        String databaseAuth = mapper.selectAuth(userId);
        log.debug("auth : {}",databaseAuth);

        //comparedDate 가 3분 이내, 요청값 Auth와 DB Auth가 일치할 경우 true를 반환.
        if(auth != null && auth.equals(databaseAuth)){
            return true;
        }

        return false;

    } // confirmEmail

    @Override
    public boolean sendEmail(String userId) throws Exception {

        log.debug("userId : {} nickname : {} ",userId);

        if(userId != null){

            // 인증키 생성후 이메일로 전송 , DB에 Insert
            String auth = Integer.toString((int)(Math.random()*3000+1));
            mailsender.sendmail("authorizationKey : "+ auth,userId);
            mapper.insertAuthorizationNumber(userId,auth);

            return true;
        }
        return false;
    }


    @Override
	public UserDTO login(LoginDTO dto) throws Exception {
        log.debug("login({}) invoked.", dto);

        UserDTO user = this.mapper.selectUserById(dto.getUserId());
        log.info("\t+ user: {}", user);
        
        return (passwordEncoder.matches(dto.getPassword(), user.getPassword()))? user:null;
	}
    
    
    @Override
	public UserDTO findId(UserDTO dto) {
		return mapper.findId(dto);
	} //findId

    
	@Override
	public boolean resetPwd(String userId, String nickname) throws Exception {

        log.debug("userId : {} nickname : {} ",userId,nickname);

        boolean mailSentCheck = false;

        String nick = mapper.selectUserNickname(userId);
        log.debug(nick);

        if(nick.equals(nickname) && nick!=null){

            // 새로운 비밀번호 생성후 이메일로 전송 , DB에 Insert
            String newpassword = Integer.toString((int)(Math.random()*3000+1));
            mailsender.sendmail("your new password is : "+ newpassword,userId);
            mapper.updatePassword(newpassword,userId);
            
            mailSentCheck = true;
        }
        return mailSentCheck;
	} // resetPwd()

	


	@Override
	public List<UserDTO> getUserList() {
		log.debug("getList() invoked.");
		
		return this.mapper.getUserList();
	} // getList
	
	@Override
	public UserDTO get(String userId) {
		log.debug("get({}) invoked.", userId);
		
		UserDTO user=this.mapper.read(userId);
		log.info("\t+ board: {}", user);
		
		return user;
	} // get ( 회원 상세 정보 보기)
	
	@Override
	public boolean modify(modifyDTO user) {
		log.debug("modify({}) invoked.", user);
		
		int affectedRows=this.mapper.update(user);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;		
	} // modify

	@Override
	public boolean remove(String userId) {
		log.debug("remove({}) invoked.", userId);

		int affectedRows=this.mapper.delete(userId);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;	
	} // remove
	

    // =====================마이페이지 관련===================== //
	
	@Override
	public List<ProductDTO> getMyAuctionList(HashMap<String, Object> map) {
		log.debug("getMyAuctionList({}) invoked.",map);
		
		List<ProductDTO> list=this.mapper.getMyAuctionList(map);
		log.info("\t+ list size: {}", list.size());
		
		return list;
	}//getMyAuctionList
	
	
	@Override
	public List<ProductDTO> getBidList(MypageCriteria cri) {
		// TODO Auto-generated method stub
		return null;
	}//getBidList
	
	
	@Override
	public Integer getMyAuctionTotal(String userId) {
		log.debug("getMyAuctionTotal({}) invoked.", userId);
		
		return this.mapper.getMyAuctionTotalCount(userId);
	}//getTotal
	
	
    // =====================카카오 로그인 API 관련===================== //
	
	@Override
	public UserDTO getKakaoUser(String kakaoUniqueId) {
		log.debug("checkKakaoId({}) invoked.", kakaoUniqueId);
		
		UserDTO user = this.mapper.getKakaoUser(kakaoUniqueId);
		
		return user;
	}//getKakaoUser
    
//---------------------------------------------------//
    @Override
    public void destroy() throws Exception {
    	// TODO Auto-generated method stub
    }
    
    @Override
    public void afterPropertiesSet() throws Exception {
    	// TODO Auto-generated method stub
    }


} // end class
