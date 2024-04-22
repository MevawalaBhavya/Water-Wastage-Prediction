package com.waterwastage.DAO;

import java.util.List;

import com.waterwastage.Model.FeedbackVO;

public interface FeedbackDAO {

	public void saveFeedback(FeedbackVO feedbackVO);
	
	public List viewUserFeedback(FeedbackVO feedbackVO);
	 
	public List viewAdminFeedback();
	
	public List getFeedbackCount();
	 
}
