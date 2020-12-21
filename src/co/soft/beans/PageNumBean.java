package co.soft.beans;

// 3
public class PageNumBean {

	// ����Ʈ ��ﶧ �ݺ��� ���۹�ȣ
	private int for_start_num;
	
	// ����Ʈ ��ﶧ �ݺ��� ����ȣ
	private int for_end_num;
	
	// ������ ����(1,2,3�������� ������ 3)
	private int page_count;
	
	// �� �������� ��� ����Ʈ ����
	private int content_list;
	
	// �������� �������� ���۰�(�������� 1,2,3.. ������ 1)
	private int page_num_min;
	
	// �������� ��������ȣ�� ��(��������ȣ�� 1~5���� ������ 5)
	private int page_num_max;
	
	// ù������
	private int page_start;
	
	// ������ ������
	private int page_end;

	private int current_page_num;
	
	
	// ������������ ����������(10���� ����� 10)�� �ܺο��� ������ �޾� ���
	// current_page_num : ���� ������ ��ȣ, total_list : ��µǴ� ������ �� ����
	public PageNumBean(int current_page_num, int total_list) {
		
		this.current_page_num=current_page_num;
		
		// �� �������� 10���� �������� ���
		content_list=10;
		
		// for�� ���� �� ���۹���(��: 1p�� (1-1)*10=0 ���ͽ���, 2p�� (2-1)*10=20���� ����)
		for_start_num=(current_page_num-1)*content_list;
		// for�� ���� �� �� ����(����Ʈ�� 10����� ����+10)
		for_end_num=for_start_num+content_list;
		// �� ��ü������ �������� �� Ŀ���� ��ü������������ ��������
		if(for_end_num>total_list) {
			for_end_num=total_list;
		}
		
		//��������ȣ�� ������������/����Ʈ�ǰ���(10)
		page_count=total_list/content_list;
		//���࿡ ������������/����Ʈ������ Ȧ���̸� +1 ���ش�(��: ��21���̰� 10���� ���� �������� 2�������� ���� 1�� ������ ����� ����. +1 ���ֱ�)
		if((total_list/content_list)%2!=0) {
			page_count=total_list/content_list+1;
		}else if((total_list/content_list)<1) {
			page_count=1;
		}
		
		///////// ȭ�鿡 ��� ��������ȣ�� ���� ����. 5���� �� ����; ��������ȣ�� 1~5, 4~8, 5~9 �̷��� ���� //////////////
		
		// ������ �ּҰ��� ���� ������-2; 1,2�������� 5���� ��ﶧ ��� ������ �ȵǹǷ� ����ó�� ����
		page_num_min=current_page_num-2;
		if((current_page_num-2)<=1) {
			page_num_min=1;
		}else if((current_page_num-2)>1&&page_count<=5) {
			page_num_min=1;
		}else if(current_page_num>page_count-2&&page_count>5) {
			 page_num_min=page_count-4;
		}
		
		
		
		// ������ �ִ밪�� ���� ������+2;
		page_num_max=current_page_num+2;
		if(page_count<5||(current_page_num+2)>page_count) {
			page_num_max=page_count;
			
		}else if(page_count>=5 && current_page_num<3) {
			// �������� 5�� �̻��϶� 1�������� Ŭ���ص� �� ȭ�鿡 5������ �߰� ����
			page_num_max=5;
		}
		
		// ù �������� 1, ������ �������� �������� ����ȣ(page_count)
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
