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
    
    @Setter(onMethod_= {@Autowired})
    private UserMapper mapper;
    
    @Setter(onMethod_= {@Autowired})
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
    	String id = "";
    	
    	id = mapper.getUserId(userId);
    	
    	if(id != null) {
    		return true;
    	}else {
    		return false;
    	}
    } // checkId()

    @Override
    public boolean checkNickName(String nickName) {
    	String nName = "";
    	
    	nName = mapper.getNickName(nickName);
    	
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

        UserDTO user = this.mapper.selectUserById(dto.getUserId());
        
        return (passwordEncoder.matches(dto.getPassword(), user.getPassword()))? user:null;
	} // login()
    
    
    @Override
	public UserDTO findId(String phone) {
		return mapper.findId(phone);
	} //findId

    
	@Override
	public boolean resetPwd(String userId, String nickname) throws Exception {

        boolean mailSentCheck = false;
        String nick = mapper.selectUserNickname(userId);
        
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
		
		return this.mapper.getUserList();
	} // getList()
	
	@Override
	public UserDTO get(String userId) {
		
		UserDTO user=this.mapper.read(userId);
		
		
		return user;
	} // get ( 회원 상세 정보 보기)
	
	@Override
	public boolean modify(modifyDTO user) {
		// 수정 시, 받은 비밀번호 암호화
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		
		int affectedRows=this.mapper.update(user);
		
		return affectedRows==1;		
	} // modify()

	@Override
	public boolean remove(String userId) {

		int affectedRows=this.mapper.delete(userId);
		
		return affectedRows==1;	
	} // remove()

	@Override
	public List<ProductDTO> getMyAuctionList(HashMap<String, Object> map) {
		
		List<ProductDTO> list=this.mapper.getMyAuctionList(map);
		
		return list;
	}//getMyAuctionList

	@Override
	public List<ProductDTO> getBidList(MypageCriteria cri) {
		return null;
	}

	@Override
	public Integer getMyAuctionTotal(String userId) {
		
		return this.mapper.getMyAuctionTotalCount(userId);
	}//getTotal

	@Override
	public List<ProductDTO> getMyBidList(ProductCriteria cri, HashMap<String, Object> map) {
		map.put("pageStart",cri.getPageStart());
		map.put("perPageNum",cri.getPerPageNum());
    	List<ProductDTO> productDTOList = mapper.getMyBidList(map);

		return productDTOList;
	}

	@Override
	public Integer getMyBidTotal(String userId) {

		return mapper.getMyBidTotalCount(userId);
	}

	@Override
	public UserDTO getKakaoUser(String kakaoUniqueId) {
		
		UserDTO user = this.mapper.getKakaoUser(kakaoUniqueId);
		
		return user;
	}//getKakaoUser
	
    // DB에 회원정보 저장
    @Override
    public boolean registerKakaoUser(UserDTO user) {

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
