package com.theantiquersroom.myapp.service;


import java.util.List;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theantiquersroom.myapp.domain.Criteria;
import com.theantiquersroom.myapp.domain.ProductVO;
import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.domain.UserVO;
import com.theantiquersroom.myapp.mapper.UserMapper;
import com.theantiquersroom.myapp.utils.Mailsender;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@AllArgsConstructor
@Log4j2

@Service
public class UserServiceImpl implements UserService, InitializingBean, DisposableBean{


    @Setter(onMethod_= {@Autowired})
    Mailsender mailsender;
    UserMapper mapper;



    @Override
    public boolean registerUser(UserDTO user) {
        log.debug("login({}) invoked.", user);
        int affectedRows = this.mapper.insertUser(user);

        return affectedRows > 0;
    }

    @Override
    public boolean checkId(String userId) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean checkNickName(String nickName) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean checkPhone(String phone) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean confirmEmail(String eCode) {
        // TODO Auto-generated method stub
        return false;
    }

    
    @Override
	public boolean login(String userId, String password) {
		log.debug("login({}, {}) invoked.", userId, password);
		
		UserVO vo =this.mapper.login(userId);
		log.info("\t+ vo: {}", vo);
		
		assert vo != null;
		
		return (vo.getPassword().equals(password));
	}

	@Override
	public UserVO findId(String nickName, String phone) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override

	public boolean resetPwd(String userId, String nickname) throws Exception {

        log.debug("userId : {} nickname : {} ",userId,nickname);
        boolean b = false;
        String nick = mapper.selectUserNickname(userId);

        log.debug(nick);

        String npw = Integer.toString((int)(Math.random()*3000+1));

        if(nick.equals(nickname) && nick!=null){
            log.debug("yes you can");

           mailsender.sendmail("your new password is : "+ npw,userId);

            mapper.updatePassword(npw,userId);

            b = true;

        }

        return b;

	}

	@Override
	public boolean modify(UserDTO userDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(String userId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ProductVO> getMyAuctionList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductVO> getBidList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// ========================================= //


	@Override
	public List<UserVO> getUserList() {
		log.debug("getList() invoked.");

		
		return this.mapper.getUserList();
	} // getList
	
	@Override
	public UserVO get(String userId) {
		log.debug("get({}) invoked.", userId);
		
		UserVO user=this.mapper.read(userId);
		log.info("\t+ board: {}", user);
		
		return user;
	} // get
	
	@Override
	public boolean modify(UserVO user) {
		log.debug("modify({}) invoked.", user);
		
		int affectedRows=this.mapper.update(user);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows==1;		
	} // modify
	
    // =====================카카오 로그인 API 관련===================== //
	
	@Override
	public UserDTO getKakaoUser(String kakaoUniqueId) {
		log.debug("checkKakaoId({}) invoked.", kakaoUniqueId);
		
		UserDTO user = this.mapper.getKakaoUser(kakaoUniqueId);
		
		return user;
	}
    
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
