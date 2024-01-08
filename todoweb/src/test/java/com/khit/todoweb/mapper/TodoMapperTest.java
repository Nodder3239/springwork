package com.khit.todoweb.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.khit.todoweb.vo.TodoVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
public class TodoMapperTest {
	
	@Autowired	//�ڵ� ���� - todoMapper�� new�� �Ŷ� ����
	private TodoMapper todoMapper;
	
	@Test
	public void testGetTime() {
		log.info(todoMapper.getTime());
	}
	/*
	@Test
	public void testInsert() {
		//������ 1�� ���� - setter -> builder()
		

		TodoVO todoVO = new TodoVO();
		todoVO.setTitle("12�� ���� ����");
		todoVO.setWriter("�쿵��");

		
		TodoVO todoVO = TodoVO.builder().title("20�� ��ϱ�").writer("user01").build();
		
		todoMapper.insert(todoVO);
	}
	*/
	
	@Test
	public void testFindAll() {
		//db�� �ִ� ������ �����ϱ�(�˻��ϱ�)
		List<TodoVO> todoList = todoMapper.findAll();
		for(TodoVO todo : todoList) {
			log.info(todo);
		}
	}
}