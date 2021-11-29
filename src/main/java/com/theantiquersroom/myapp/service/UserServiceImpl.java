package com.theantiquersroom.myapp.service;


import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

import com.theantiquersroom.myapp.domain.*;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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
        // 비밀번호 암호화
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        int affectedRows = this.mapper.insertUser(user);

        return affectedRows > 0;
    } // registerUser()

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
    } // checkId()

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
    } // checkNickName()

    @Override
    public boolean checkPhone(String phone) {

    	String pNum = "";
    	
    	pNum = mapper.getPhone(phone);
    	
    	if(pNum != null) {
    		return true;
    	}else {
    		return false;
    	}
    } // checkPhone()

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

    } // confirmEmail()

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
    } // sendEmail()


    @Override
	public UserDTO login(LoginDTO dto) throws Exception {
        log.debug("login({}) invoked.", dto);

        UserDTO user = this.mapper.selectUserById(dto.getUserId());
        log.info("\t+ user: {}", user);
        
        return (passwordEncoder.matches(dto.getPassword(), user.getPassword()))? user:null;
	} // login()
    
    
    @Override
	public UserDTO findId(String phone) {
		return mapper.findId(phone);
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
            log.debug(newpassword);
            mailsender.sendmail("your new password is : "+ newpassword,userId);
            mapper.updatePassword(passwordEncoder.encode(newpassword),userId);
            
            mailSentCheck = true;
        }
        return mailSentCheck;
	} // resetPwd()

	@Override
	public List<UserDTO> getUserList() {
		log.debug("getList() invoked.");
		
		return this.mapper.getUserList();
	} // getList()
	
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
		
		// 회원 비밀번호를 인코딩하기 위한 객체 선언
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		//회원 비밀번호를 암호화하여 user 객체에 다시 저장
		String securePw = encoder.encode(user.getPassword());
		user.setPassword(securePw);
		
		int affectedRows=this.mapper.update(user);
			
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;		
	} // modify()

	@Override
	public boolean remove(String userId) {
		log.debug("remove({}) invoked.", userId);

		int affectedRows=this.mapper.delete(userId);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;	
	} // remove()

	@Override
	public List<ProductDTO> getMyAuctionList(HashMap<String, Object> map) {
		log.debug("getMyAuctionList({}) invoked.",map);
		
		List<ProductDTO> list=this.mapper.getMyAuctionList(map);
		log.info("\t+ list size: {}", list.size());
		
		return list;
	}//getMyAuctionList

	@Override
	public List<ProductDTO> getBidList(MypageCriteria cri) {
		return null;
	}

	@Override
	public Integer getMyAuctionTotal(String userId) {
		log.debug("getMyAuctionTotal({}) invoked.", userId);
		
		return this.mapper.getMyAuctionTotalCount(userId);
	}//getTotal

	@Override
	public List<ProductDTO> getMyBidList(ProductCriteria cri, HashMap<String, Object> map) {
		map.put("pageStart",cri.getPageStart());
		map.put("perPageNum",cri.getPerPageNum());
    	log.debug("getMyBidList({}) invoked.",map);
    	List<ProductDTO> productDTOList = mapper.getMyBidList(map);

		return productDTOList;
	}

	@Override
	public Integer getMyBidTotal(String userId) {
		log.debug("getMyBidTotal({}) invoked.", userId);

		return mapper.getMyBidTotalCount(userId);
	}

	@Override
	public UserDTO getKakaoUser(String kakaoUniqueId) {
		log.debug("checkKakaoId({}) invoked.", kakaoUniqueId);
		
		UserDTO user = this.mapper.getKakaoUser(kakaoUniqueId);
		
		return user;
	}//getKakaoUser
	
    // DB에 회원정보 저장
    @Override
    public boolean registerKakaoUser(UserDTO user) {
        log.debug("registerKakaoUser({}) invoked.", user);

        Integer users = null;
        
        users = mapper.insertUser(user);
        
        int affectedRows = this.mapper.insertKakaoUser(user);

        return affectedRows > 0;
    } // registerKakaoUser()

    @Override
    public void destroy() throws Exception {
    	// TODO Auto-generated method stub
    } // destroy()

    @Override
    public void afterPropertiesSet() throws Exception {
    	// TODO Auto-generated method stub
    } // afterPropertiesSet()

} // end class
