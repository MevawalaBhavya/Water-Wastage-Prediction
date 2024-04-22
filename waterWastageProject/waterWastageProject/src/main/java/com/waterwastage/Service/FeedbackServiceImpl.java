package com.waterwastage.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.waterwastage.DAO.FeedbackDAO;
import com.waterwastage.Model.FeedbackVO;

@Service
@Transactional
public class FeedbackServiceImpl implements FeedbackService {

	@Autowired
	FeedbackDAO feedbackDAO;
	
	@Override
	public void saveFeedback(FeedbackVO feedbackVO) {
		this.feedbackDAO.saveFeedback(feedbackVO);
	}

	@Override
	public List viewUserFeedback(FeedbackVO feedbackVO) {
		return this.feedbackDAO.viewUserFeedback(feedbackVO);
	}

	@Override
	public List viewAdminFeedback(FeedbackVO feedbackVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getFeedbackCount() {
		// TODO Auto-generated method stub
		return this.feedbackDAO.getFeedbackCount();
	}

	
}
