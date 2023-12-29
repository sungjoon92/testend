package kr.co.fmos.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/movie")
public class MovieCont {

	@Autowired
	private MovieDAO movieDao;

	public MovieCont() {
		System.out.println("MovieCont() 객체 생성");
	}

//	//조회
//	@GetMapping("/List")
//	@ResponseBody
//	public List<MovieDTO> mCommentServiceList(int product_code)throws Exception {
//		List<MovieDTO> list = movieDao.movieList(product_code);
//		return list;
//	}//mCommentserviceInsert() end

	@GetMapping("/list.do")
	public ModelAndView list() {
	
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", movieDao.movieList());
		mav.setViewName("movie/list");
		return mav;
	}//list() end

	@GetMapping("/write.do")
	public String write() {
		//로그인 했다면
//		String s_id="itwill";
		return "movie/write";
	}//list() end
	
	
	//추가
		@PostMapping("/insert.do")
		@ResponseBody
		public ModelAndView insert(MovieDTO moviedto, HttpSession session)throws Exception {
										  //HttpServletRequest req
										  //@ModelAttribute CommentDTO commentDto
			
			ModelAndView mav = new ModelAndView();
			 
			int cnt=movieDao.movieinsert(moviedto);
		
			if(cnt != 0) {
				mav.addObject("msg1", "<p>추가 완료되었습니다</p>");
				mav.addObject("msg2", "<p><a onclick='history.back()'>[전 페이지로]</a></p>");
			} else {
				mav.addObject("msg1", "<p>추가 실패하였습니다</p>");
				mav.addObject("msg2", "<p><a href='javascript:history.back()'>[다시시도]</a></p>");
			}; // if end
 
			mav.setViewName("msgView");
			return mav;
		
		}//movieinsert() end
		
	
	//사용가능하지만 DAO에서 selectone 으로 한개만 생성시 사용
//		@GetMapping("/detail/{movie_id}")
//		public ModelAndView detail(@PathVariable String movie_id) {
//			ModelAndView mav = new ModelAndView();
//			mav.addObject("detail", movieDao.movieDetail(movie_id));
//			mav.addObject("review", movieDao.moviereviewList(movie_id));
//			mav.setViewName("/movie/detail");
//			return mav;
//		}//list() end
		
		
		
		//spring04_web프로젝트 참조		
		
		@GetMapping("/detail.do")
		//1)public ModelAndView detail(HttpServletRequest req) {
			//String movie_id=req.getParameter("movie_id");
		//2)public ModelAndView detail(@ModelAttribute MoviereviewDTO dto) {
			//String movie_id = dto.getMovie_id();
		//3)
//		public ModelAndView detail(String movie_id,HttpServletRequest req, MoviereviewDTO dto) {
//			String a= movie_id;
//			String b=req.getParameter("movie_id");
//			String c=dto.getMovie_id();
		
		//4)의 전제조건 detail?movie_id 에서 변수명이 동일하다는 전제하에
		public ModelAndView detail(String movie_id) {			
			//요청값이 전달 되었는지 확인하겠습니다
			//System.out.println(movie_id);			
			//System.out.println(movieDao.moviereviewList(movie_id).size());
//			System.out.println(movieDao.moviereviewList(movie_id));			
//			List<MoviereviewDTO> list=movieDao.moviereviewList(movie_id);
//			for(int i=0; i<list.size(); i++) {
//				MoviereviewDTO dto=list.get(i);
//				System.out.println(dto.getReview_id());
//			}
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("detail", movieDao.movieDetail(movie_id));
			mav.addObject("review", movieDao.moviereviewList(movie_id));
			mav.setViewName("/movie/detail");
			return mav;
		}//list() end
		
		
		
		
	
		
		
		
		


}
