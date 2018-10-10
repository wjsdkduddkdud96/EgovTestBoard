package egovframework.let.cop.bbs.service.impl;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import egovframework.let.cop.bbs.service.Board;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.TestBoard;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;

/**
 * 게시물 관리를 위한 데이터 접근 클래스
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009.03.19
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.19  이삼섭          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */
@Repository("BBSManageDAO")
public class BBSManageDAO extends EgovAbstractDAO {

    /**
     * 게시판에 게시물을 등록 한다.
     *
     * @param board
     * @throws Exception
     */
    public void insertBoardArticle(Board board) throws Exception {
	long nttId = (Long)select("BBSManageDAO.selectMaxNttId");
	board.setNttId(nttId);

	insert("BBSManageDAO.insertBoardArticle", board);
    }

    /**
     * 게시판에 답변 게시물을 등록 한다.
     *
     * @param board
     * @throws Exception
     */
    public long replyBoardArticle(Board board) throws Exception {
	long nttId = (Long)select("BBSManageDAO.selectMaxNttId");
	board.setNttId(nttId);

	insert("BBSManageDAO.replyBoardArticle", board);

	//----------------------------------------------------------
	// 현재 글 이후 게시물에 대한 NTT_NO를 증가 (정렬을 추가하기 위해)
	//----------------------------------------------------------
	//String parentId = board.getParnts();
	long nttNo = (Long)select("BBSManageDAO.getParentNttNo", board);

	board.setNttNo(nttNo);
	update("BBSManageDAO.updateOtherNttNo", board);

	board.setNttNo(nttNo + 1);
	update("BBSManageDAO.updateNttNo", board);

	return nttId;
    }

    /**
     * 게시물 한 건에 대하여 상세 내용을 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    public BoardVO selectBoardArticle(BoardVO boardVO) throws Exception {
	return (BoardVO)select("BBSManageDAO.selectBoardArticle", boardVO);
    }

    /**
     * 조건에 맞는 게시물 목록을 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectBoardArticleList(BoardVO boardVO) throws Exception {
	return (List<BoardVO>) list("BBSManageDAO.selectBoardArticleList", boardVO);
    }

    /**
     * 조건에 맞는 게시물 목록에 대한 전체 건수를 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectBoardArticleListCnt(BoardVO boardVO) throws Exception {
	return (Integer)select("BBSManageDAO.selectBoardArticleListCnt", boardVO);
    }

    /**
     * 게시물 한 건의 내용을 수정 한다.
     *
     * @param board
     * @throws Exception
     */
    public void updateBoardArticle(Board board) throws Exception {
	update("BBSManageDAO.updateBoardArticle", board);
    }

    /**
     * 게시물 한 건을 삭제 한다.
     *
     * @param board
     * @throws Exception
     */
    public void deleteBoardArticle(Board board) throws Exception {
	update("BBSManageDAO.deleteBoardArticle", board);
    }

    /**
     * 게시물에 대한 조회 건수를 수정 한다.
     *
     * @param board
     * @throws Exception
     */
    public void updateInqireCo(BoardVO boardVO) throws Exception {
	update("BBSManageDAO.updateInqireCo", boardVO);
    }

    /**
     * 게시물에 대한 현재 조회 건수를 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectMaxInqireCo(BoardVO boardVO) throws Exception {
	return (Integer)select("BBSManageDAO.selectMaxInqireCo", boardVO);
    }

    /**
     * 게시판에 대한 목록을 정렬 순서로 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectNoticeListForSort(Board board) throws Exception {
	return (List<BoardVO>) list("BBSManageDAO.selectNoticeListForSort", board);
    }

    /**
     * 게사판에 대한 정렬 순서를 수정 한다.
     *
     * @param sortList
     * @throws Exception
     */
    public void updateSortOrder(List<BoardVO> sortList) throws Exception {
	BoardVO vo;
	Iterator<BoardVO> iter = sortList.iterator();
	while (iter.hasNext()) {
	    vo = (BoardVO)iter.next();
	    update("BBSManageDAO.updateSortOrder", vo);
	}
    }

    /**
     * 게시판에 대한 현재 게시물 번호의 최대값을 구한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    public long selectNoticeItemForSort(Board board) throws Exception {
	return (Long)select("BBSManageDAO.selectNoticeItemForSort", board);
    }

    /**
     * 방명록에 대한 목록을 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<BoardVO> selectGuestList(BoardVO boardVO) throws Exception {
	return (List<BoardVO>) list("BBSManageDAO.selectGuestList", boardVO);
    }

    /**
     * 방명록에 대한 목록 건수를 조회 한다.
     *
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectGuestListCnt(BoardVO boardVO) throws Exception {
	return (Integer)select("BBSManageDAO.selectGuestListCnt", boardVO);
    }

    /**
     * 방명록 내용을 삭제 한다.
     *
     * @param boardVO
     * @throws Exception
     */
    public void deleteGuestList(BoardVO boardVO) throws Exception {
	update("BBSManageDAO.deleteGuestList", boardVO);
    }

    /**
     * 방명록에 대한 패스워드를 조회 한다.
     *
     * @param board
     * @return
     * @throws Exception
     */
    public String getPasswordInf(Board board) throws Exception {
	return (String)select("BBSManageDAO.getPasswordInf", board);
    }

    
    /*TestBoard 목록 조회*/
	@SuppressWarnings("unchecked")
	public ArrayList<TestBoard> selectTestBoard(TestBoard testBoard) {
		return (ArrayList<TestBoard>) list("BBSManageDAO.selectTestBoard", testBoard);
	}

	public int insertTestBoard(TestBoard testBoard) {
		System.out.println("dao 도착"+testBoard.getTestBoard_delYN());
		int testBoard_idx=(int) insert("BBSManageDAO.insertTestBoard", testBoard);
		System.out.println(testBoard_idx);
		return testBoard_idx;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<TestBoard> registTestBoard(TestBoard testBoard) {
		return (ArrayList<TestBoard>) list("BBSManageDAO.registTestBoard", testBoard);
	}

	public void uphitsTestBoard(TestBoard testBoard) {
		update("BBSManageDAO.uphitsTestBoard",testBoard);
		
	}

	public void updateTestBoard(TestBoard testBoard) {
		update("BBSManageDAO.updateTestBoard",testBoard);
	}

	public void deleteTestBoard(TestBoard testBoard) {
		System.out.println(testBoard.getTestBoard_idx()+"/"+testBoard.getTestBoard_subject());
		update("BBSManageDAO.deleteTestBoard",testBoard);
		
	}

	public int selecttestBoardCnt(TestBoard testBoard) {
		return (int) select("BBSManageDAO.selectTestBoardCnt",testBoard);
	}

	@SuppressWarnings("unchecked")
	public ArrayList<TestBoard> selectTestBoardno(TestBoard testBoard) {
		return (ArrayList<TestBoard>) list("BBSManageDAO.selectTestBoardno", testBoard);
	}

	public void replyUpdTestBoard(TestBoard testBoard) {
		update("BBSManageDAO.replyUpdTestBoard", testBoard);
		
	}

	public void replyInTestBoard(TestBoard testBoard) {
		insert("BBSManageDAO.replyInTestBoard", testBoard);
		
	}

	public void insertTestBoardSo(TestBoard testBoard) {
		insert("BBSManageDAO.insertTestBoardSo", testBoard);
		
	}

	@SuppressWarnings("unchecked")
	public ArrayList<TestBoard> registTestBoardCheck(TestBoard testBoard) {
		return (ArrayList<TestBoard>) list("BBSManageDAO.registTestBoardCheck", testBoard);
		
	}

	public void deleteTestBoardCheck(TestBoard testBoard) {
		delete("BBSManageDAO.deleteTestBoardCheck",testBoard);
	}


}