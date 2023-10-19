import java.util.ArrayList;

import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.member.model.vo.Member;
import com.kh.uglytasty.order.model.vo.Order;
import com.kh.uglytasty.subscribe.model.vo.Subscribe;

public interface AdminService {

	
	ArrayList<Order> selectOrderList(PageInfo pi);
	int selectOrderListCount();
	
	ArrayList<Member> selectMemberList(PageInfo pi);
	int selectMemberListCount();
	
	ArrayList<Subscribe> selectSubscribeList(PageInfo pi);
	int selectSubscribeCount();
	
	
	int updateAdminOrder(Order b);
	int updateAdminSubscribe(Subscribe b);
	int updateAdminMember(Member b);
	
	
	

}
