package com.waterwastage.Service;

import java.util.List;

import com.waterwastage.Model.FeedbackVO;

public interface FeedbackService {

	public void saveFeedback(FeedbackVO feedbackVO);
	
	public List viewUserFeedback(FeedbackVO feedbackVO);
	
	public List viewAdminFeedback(FeedbackVO feedbackVO);

	public List getFeedbackCount();
	
	
	
}
