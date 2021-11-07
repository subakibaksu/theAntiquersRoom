package com.theantiquersroom.myapp.service;


import com.theantiquersroom.myapp.domain.Criteria;
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

    private UserMapper mapper;

    @Setter(onMethod_= {@Autowired})
    Mailsender mailsender;


    @Override
    public boolean registerUsers(UserVO user) {
        // TODO Auto-generated method stub
        return false;
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
	public boolean login(String id, String pwd) {
		log.debug("login() invoked.");
		
		return false;
	}

	@Override
	public boolean findId(String nickName, String phone) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean resetPwd(String userId, String nickname) throws Exception {

        log.debug("userId : {} nicknmae : {} ",userId,nickname);

        mailsender.sendmail("email sent..",userId);

        return false;
	}

	@Override
	public boolean modify(UserDTO userDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean getMyAuctionList(Criteria cri) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean getBidList(Criteria cri) {
		// TODO Auto-generated method stub
		return false;
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
