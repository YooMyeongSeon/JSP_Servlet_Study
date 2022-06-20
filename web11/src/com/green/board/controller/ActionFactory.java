package com.green.board.controller;

import com.green.board.controller.action.Action;
import com.green.board.controller.action.BoardCheckPassAction;
import com.green.board.controller.action.BoardCheckPassFormAction;
import com.green.board.controller.action.BoardDeleteAction;
import com.green.board.controller.action.BoardListAction;
import com.green.board.controller.action.BoardUpdateAction;
import com.green.board.controller.action.BoardUpdateFromAction;
import com.green.board.controller.action.BoardViewAction;
import com.green.board.controller.action.BoardWriteAction;
import com.green.board.controller.action.BoardWriteFormAction;

public class ActionFactory {
	private ActionFactory() {}
	
	private static ActionFactory af = new ActionFactory();
	
	public static ActionFactory getInstance() {
		return af;
	}
	
	//----------
	
	public Action getAction(String command) {
		Action action = null;
		
		if (command.equals("BoardListAction")) {
			action = new BoardListAction();
		} else if (command.equals("BoardWriteForm")) {
			action = new BoardWriteFormAction();
		} else if (command.equals("BoardWrite")) {
			action = new BoardWriteAction();
		} else if (command.equals("BoardView")) {
			action = new BoardViewAction();
		} else if (command.equals("BoardCheckPassForm")) {
			action = new BoardCheckPassFormAction();
		} else if (command.equals("BoardCheckPass")) {
			action = new BoardCheckPassAction();
		} else if (command.equals("BoardDelete")) {
			action = new BoardDeleteAction();
		} else if (command.equals("BoardUpdateFrom")) {
			action = new BoardUpdateFromAction();
		} else if (command.equals("BoardUpdate")) {
			action = new BoardUpdateAction();
		}
		return action;
	}
}
