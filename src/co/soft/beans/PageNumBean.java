package co.soft.beans;

// 3
public class PageNumBean {

	// 리스트 띄울때 반복분 시작번호
	private int for_start_num;
	
	// 리스트 띄울때 반복문 끝번호
	private int for_end_num;
	
	// 페이지 개수(1,2,3페이지가 있으면 3)
	private int page_count;
	
	// 한 페이지에 띄울 리스트 개수
	private int content_list;
	
	// 보여지는 페이지의 시작값(페이지가 1,2,3.. 있으면 1)
	private int page_num_min;
	
	// 보여지는 페이지번호의 끝(페이지번호가 1~5까지 있으면 5)
	private int page_num_max;
	
	// 첫페이지
	private int page_start;
	
	// 마지막 페이지
	private int page_end;

	private int current_page_num;
	
	
	// 현재페이지와 컨텐츠개수(10개씩 띄우기면 10)는 외부에서 주입을 받아 사용
	// current_page_num : 현재 페이지 번호, total_list : 출력되는 컨텐츠 총 개수
	public PageNumBean(int current_page_num, int total_list) {
		
		this.current_page_num=current_page_num;
		
		// 한 페이지당 10개의 컨텐츠만 띄움
		content_list=10;
		
		// for문 돌릴 때 시작범위(예: 1p면 (1-1)*10=0 부터시작, 2p면 (2-1)*10=20부터 시작)
		for_start_num=(current_page_num-1)*content_list;
		// for문 돌릴 때 끝 범위(리스트가 10개라면 시작+10)
		for_end_num=for_start_num+content_list;
		// 단 전체컨텐츠 개수보다 더 커지면 전체컨텐츠개수로 변경해줌
		if(for_end_num>total_list) {
			for_end_num=total_list;
		}
		
		//페이지번호는 총컨텐츠개수/리스트의개수(10)
		page_count=total_list/content_list;
		//만약에 총컨텐츠개수/리스트개수가 홀수이면 +1 해준다(예: 총21개이고 10개씩 띄우면 나눴을때 2페이지만 떠서 1개 컨텐츠 띄우지 못함. +1 해주기)
		if((total_list/content_list)%2!=0) {
			page_count=total_list/content_list+1;
		}else if((total_list/content_list)<1) {
			page_count=1;
		}
		
		///////// 화면에 띄울 페이지번호의 개수 지정. 5개로 할 예정; 페이지번호는 1~5, 4~8, 5~9 이런식 구성 //////////////
		
		// 페이지 최소값을 현재 페이지-2; 1,2페이지는 5개씩 띄울때 가운데 정렬이 안되므로 예외처리 해줌
		page_num_min=current_page_num-2;
		if((current_page_num-2)<=1) {
			page_num_min=1;
		}else if((current_page_num-2)>1&&page_count<=5) {
			page_num_min=1;
		}else if(current_page_num>page_count-2&&page_count>5) {
			 page_num_min=page_count-4;
		}
		
		
		
		// 페이지 최대값을 현재 페이지+2;
		page_num_max=current_page_num+2;
		if(page_count<5||(current_page_num+2)>page_count) {
			page_num_max=page_count;
			
		}else if(page_count>=5 && current_page_num<3) {
			// 페이지가 5개 이상일때 1페이지를 클릭해도 한 화면에 5개까지 뜨게 셋팅
			page_num_max=5;
		}
		
		// 첫 페이지는 1, 마지막 페이지는 페이지의 끝번호(page_count)
		page_start=1;
		page_end=page_count;
		
	}


	public int getFor_start_num() {
		return for_start_num;
	}


	public void setFor_start_num(int for_start_num) {
		this.for_start_num = for_start_num;
	}


	public int getFor_end_num() {
		return for_end_num;
	}


	public void setFor_end_num(int for_end_num) {
		this.for_end_num = for_end_num;
	}


	public int getPage_count() {
		return page_count;
	}


	public void setPage_count(int page_count) {
		this.page_count = page_count;
	}


	public int getContent_list() {
		return content_list;
	}


	public void setContent_list(int content_list) {
		this.content_list = content_list;
	}


	public int getPage_num_min() {
		return page_num_min;
	}


	public void setPage_num_min(int page_num_min) {
		this.page_num_min = page_num_min;
	}


	public int getPage_num_max() {
		return page_num_max;
	}


	public void setPage_num_max(int page_num_max) {
		this.page_num_max = page_num_max;
	}


	public int getPage_start() {
		return page_start;
	}


	public void setPage_start(int page_start) {
		this.page_start = page_start;
	}


	public int getPage_end() {
		return page_end;
	}


	public void setPage_end(int page_end) {
		this.page_end = page_end;
	}
	
	
	public int getCurrent_page_num() {
		return current_page_num;
	}
	
	
	public void setCurrent_page_num(int current_page_num) {
		this.current_page_num = current_page_num;
	}

	
}
