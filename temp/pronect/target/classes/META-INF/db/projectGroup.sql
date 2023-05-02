--getGroupList()
-- projectList()TOP-N
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM
        (SELECT * FROM PROJECT WHERE PCOMPLETE = 'N' ORDER BY SID DESC) A) 
WHERE RN BETWEEN 1 AND 10; 
-- projectTotCnt
SELECT COUNT(*) FROM PROJECT WHERE PCOMPLETE = 'N';
--registerGroup(projectDto)
INSERT INTO PROJECT (PID, MID, PTITLE, PCONTENT, PPEOPLE, 
                    PLANGUAGE1, PLANGUAGE2, PLANGUAGE3, PSDATE, PFDATE, PDEV, PDESIGN, PM, PLOC)
            VALUES(PROJECT_SEQ.NEXTVAL, 'test1-1','스터디모집','모집합니다',5,
                    'Java','JavaScript',null,'23/05/01','23/06/04','N','Y','Y','서울');
--MID로 방금 등록한(완료되지 않은 스터디) 글의 번호를 가져옴
SELECT PID FROM PROJECT WHERE MID = 'test1-1' AND PCOMPLETE = 'N';
--가져온 PID와 세션의 MID로 히스토리에 저장
INSERT INTO PSTATUS (PSID, MID, PID, PSSTATUS)
            VALUES (PSTATUS_SEQ.NEXTVAL, 'test1-1',1,2);
            SELECT * FROM PSTATUS;
--getProjectDetail(pId)
SELECT * FROM PROJECT WHERE PID = 1;
--modifyProject(projectDto)
UPDATE PROJECT SET PTITLE = '스터디 모집합니다(수정)',
                PCONTENT = '모집합니다(수정)',
                PPEOPLE = 4,
                PLANGUAGE1 = 'JavaScript',
                PLANGUAGE2 = 'Spring',
                PLANGUAGE3 = 'Java',
                PSDATE = '23/05/02',
                PFDATE = '23/06/05',
                PDEV = 'Y',
                PDESIGN = 'N',
                PM = 'Y',
                PLOC = NULL
        WHERE PID = 1;
--deleteProject(pId)
UPDATE PSTATUS SET PSSTATUS = 4 WHERE PID = 1;
UPDATE PROJECT SET PCOMPLETE = 'D' WHERE PID = 1;
-- comment(commentDto)
INSERT INTO PCOMMENT (PCID, MID, PCCONTENT, PCIP, PID)
            VALUES(PCOMMENT_SEQ.NEXTVAL, 'test1-1','ㅎㅎ','182','1');
-- commentContent(pid)
SELECT * FROM PCOMMENT WHERE PID = 1;
-- commentModify(commentDto)
UPDATE PCOMMENT SET PCCONTENT = 'AA'
                    WHERE PCID=1;
-- commentDelete(pcId)
DELETE SCOMMENT WHERE SCID=8;
--joinProject(pId,mId)
INSERT INTO PSTATUS (PSID, MID, PID, PSSTATUS)
            VALUES (PSTATUS_SEQ.NEXTVAL, 'teemo',1,1);
--acceptProject(mId)
UPDATE PSTATUS SET PSSTATUS = 2 WHERE MID = 'teemo';
--completeProject(pId)
UPDATE PSTATUS SET PSSTATUS = 3 WHERE PID = 1;