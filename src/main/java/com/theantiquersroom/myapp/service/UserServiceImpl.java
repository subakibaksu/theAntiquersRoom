package com.theantiquersroom.myapp.service;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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




@AllArgsConstructor
@Log4j2

@Service
public class UserServiceImpl implements UserService, InitializingBean, DisposableBean{


    @Setter(onMethod_= {@Autowired})
    Mailsender mailsender;
    UserMapper mapper;



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
    public boolean confirmEmail(String userId, String auth) throws ParseException {

        boolean isChecked = false;
        log.debug("confirmEmail invoked userId : {} auth : {}",userId,auth);

        //DB에서 SELECT한 값을 DATE로 변환
        String stringSeverTime = mapper.selectNow();
        String userMailSentTime = mapper.selectUpdatedate(userId);
        SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date databaseTime = transFormat.parse(stringSeverTime);
        Date userTime = transFormat.parse(userMailSentTime);
        log.debug("userTime : {}",userTime);
        log.debug("severTime : {}",databaseTime);

        //DB시간과 유저시간의 차이계산
        long comparedDate = databaseTime.getTime() - userTime.getTime();
        log.debug(comparedDate);

        //DB Auth값 조회
        String databaseAuth = mapper.selectAuth(userId);
        log.debug("auth : {}",databaseAuth);

        //comparedDate 가 3분 이내, 요청값 Auth와 DB Auth가 일치할 경우 true를 반환.
        if(comparedDate < 3*60*1000 && auth.equals(databaseAuth)){
            isChecked = true;
        }

        return isChecked;

    } // confirmEmail

    @Override
    public boolean sendEmail(String userId) throws Exception {

        log.debug("userId : {} nickname : {} ",userId);

        boolean mailSentCheck = false;

        if(userId != null){

            // 인증키 생성후 이메일로 전송 , DB에 Insert
            String auth = Integer.toString((int)(Math.random()*3000+1));
            mailsender.sendmail("authorizationKey : "+ auth,userId);
            mapper.insertAuthorizationNumber(userId,auth);

            mailSentCheck = true;

        }

        return mailSentCheck;
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
