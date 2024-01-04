<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>테트리스</title>
<style>
*{	
    box-sizing: border-box;
    margin: 0 auto;
    padding: 0;
}

html, body{
    height: 100%;
    overflow: hidden;
}

ul{
    list-style: none;
}

.Tetris_wrap{
	margin-top: 10px;
    text-align: center;
}

.gameStart{
    display: block;
    position: absolute;
    top: 50%;
    left: 50%;
    width: 300px;
    height: 300px;
    transform: translate(-50%, -50%);
    text-align: center;
    background: #FCF6F5;
    z-index: 9999;
}
.start_inner{
    padding: 30px;
    z-index: 9999;
}

.startBtn{
    position: absolute;
    top: 0; left: 0;
    width: 100%;
    height: 100%;
    z-index: 9999;
    border: none;
    background: transparent;
    cursor: pointer;
    outline: 0;
}

.startBtn:hover ~ .b1{
    background-color: #f6395a;
}
.startBtn:hover ~ .b2{
    background-color: #c0e218;
}
.startBtn:hover ~ .b3{
    background-color: #33D8F5;
}
.startBtn:hover ~ .b4{
    background-color: #3e7aed;
}


.startBtn:hover ~ div>span{
    color: #fff;
}

.start_inner>div{
    position: absolute;
    width: 50%;
    height: 50%;
    line-height: 150px;
    border-top: 12px solid rgba(240,240,240, 0.5);
    border-right: 12px solid rgba(0,0,0, 0.3);
    border-bottom: 12px solid rgba(0,0,0, 0.9);
    border-left: 12px solid rgba(0,0,0, 0.1);
    z-index: 10;
    transition: .3s ease;
}

.start_inner>div span{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 70px;
    transition: color .3s ease;
}

.b1{ top: 0; left: 0;}
.b2{ top: 0;right: 0;}
.b3{ bottom: 0; left: 0;}
.b4{ bottom: 0; right: 0;}


.gameStart>button:hover{
    background-color: #394867;
    color: #fff;
}

.gameEnd{
    display: none;
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgb(0,0,0, 0.5);
    z-index: 9999;
}

.end_inner{
    position: absolute;
    top: 50%;
    left: 50%;
    width: 350px;
    height: 220px;
    transform: translate(-50%, -50%);
    padding: 30px;
    text-align: center;
    background: #e7e6e1;
    opacity: 1;
    transition: opacity 0.3s ease;
}

.end_inner>h2{
    color: #000;
    margin: 35px 0;
    font-size: 35px;
}

.end_inner>button{
    position: absolute;
    bottom: 30px;
    left: 50%;
    transform: translate(-50%, 0);
    padding: 10px 55px;
    font-size: 17px;
    line-height: 17px;
    background-color: #c9cbff;
    outline: 0;
    border: none;
    cursor: pointer;
    transition: 0.3s;
}

.end_inner>button:hover{
    background: #394867;
    color: #fff;
}

.tetris_board{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.tetris_board>ul{
    width: 300px;
}

.tetris_board>ul>li{
    height: 30px;
}

.tetris_board>ul>li>ul{
    display: flex
}

.tetris_board>ul>li>ul>li{
    width: 30px;
    height: 30px;
    outline: 1px solid #aaa;
}

.bar{
    background: #f6395a;
    border-top: 4px solid rgba(240,240,240, 0.5);
    border-right: 4px solid rgba(0,0,0, 0.3);
    border-bottom: 4px solid rgba(0,0,0, 0.9);
    border-left: 4px solid rgba(0,0,0, 0.1);
}

.tree{
    background: #c0e218;
}

.zee{
    background: #33D8F5;
}

.elLeft{
    background: #e449b8;
}

.elRight{
    background: #fedf46;
}

.squre{
    background: #3e7aed;
}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
</div>
<div class="gameEnd">
    <div class="end_inner">
        <h2>게임 끝!!!</h2>
        <button class="restartBtn">다시하기</button>
    </div>
</div>
<div class="gameStart">
    <div class="start_inner">
        <button href="#" class="startBtn"></button>
        <div class="b1"><span>시</span></div>
        <div class="b2"><span>작</span></div>
        <div class="b3"><span>하</span></div>
        <div class="b4"><span>기</span></div>
    </div>
</div>
    <div class="Tetris_wrap">
        <h2 class="score">점수 : 0</h2>  
        <div class="tetris_board">
            <ul></ul>
        </div>
    </div>
	<div style="height:700px">
    </div>
    <jsp:include page="../layout/footer.jsp"/>	
    
<script>
const blocks = { // 각 블록에는 전환했을때 표시할 4개 블록
	    tree : [
	        [[1, 0], [0, 1], [1, 1], [2, 1]],
	        [[2, 1], [1, 0], [1, 1], [1, 2]],
	        [[2, 1], [0, 1], [1, 1], [1, 2]],
	        [[0, 1], [1, 2], [1, 1], [1, 0]]
	    ],
	    squre : [
	        [[0,0], [0,1], [1, 0], [1, 1]],
	        [[0,0], [0,1], [1, 0], [1, 1]],
	        [[0,0], [0,1], [1, 0], [1, 1]],
	        [[0,0], [0,1], [1, 0], [1, 1]]
	    ],
	    bar : [
	        [[1, 0], [2, 0], [3, 0], [4, 0]],
	        [[2, -1], [2, 0], [2, 1], [2, 2]],
	        [[1, 0], [2, 0], [3, 0], [4, 0]],
	        [[2, -1], [2,0], [2, 1], [2, 2]]
	    ],
	    zee : [
	        [[0, 0], [1, 0], [1, 1], [2, 1]],
	        [[0, 1], [1, 0], [1, 1], [0, 2]],
	        [[0, 1], [1, 1], [1, 2], [2, 2]],
	        [[2, 0], [2, 1], [1, 1], [1, 2]]
	    ],
	    elLeft : [
	        [[0, 0], [1, 0], [2, 0], [0, 1]],
	        [[1, 0], [1, 1], [1, 2], [0, 0]],
	        [[2, 0], [0, 1], [1, 1], [2, 1]],
	        [[0, 0], [0, 1], [0, 2], [1, 2]]
	    ],
	    elRight : [
	        [[0, 0], [1, 0], [2, 0], [2, 1]],
	        [[2, 0], [2, 1], [2, 2], [1, 2]],
	        [[0, 0], [0, 1], [1, 1], [2, 1]],
	        [[1, 0], [2, 0], [1, 1], [1, 2]]
	    ]
	}

	// DOM
	const start = document.querySelector(".tetris_board>ul");
	const gameEnd = document.querySelector('.gameEnd');
	const gameStart = document.querySelector('.gameStart');
	const StartBtn = document.querySelector('.startBtn');
	const reStartBtn = document.querySelector('.restartBtn');
	const scoreDisplay = document.querySelector(".score");

	//Start Setting
	const tetris_cols = 10; // 가로 개수
	const tetris_rows = 20; // 세로 개수

	//variables
	let score = 0;
	let speed = 500;
	let downInterval;
	let temp_block;

	const move_item = {
	    type : 'tree', //블록 타입
	    direction : 0, //위 화살표를 눌렀을때 방향 전환
	    location_top : 0, //블록의 위치 x값 0~9
	    location_left : 3 //블록의 위치 y값 0~19
	}


	//functions
	function init(){
	    temp_block = {...move_item};
	    for(let i= 0 ; i < tetris_rows ; i++){
	        prependNewLine();
	    }
	    generateNewBlock();
	}

	function prependNewLine(){
	    
	        const trans_li = document.createElement('li');
	        const bar_ul = document.createElement('ul');

	        for(let j = 0 ; j< tetris_cols ; j++){

	            const tetris_block = document.createElement('li');
	            bar_ul.prepend(tetris_block);
	        }

	        trans_li.prepend(bar_ul);
	        start.prepend(trans_li)   
	    }

	function rendering(moveType = ""){

	    const { type, direction, location_top, location_left } = temp_block;
	    //이동 효과를 주기 위해 이동 전 블록의 클랙스를 지움
	    const movingBlocks = document.querySelectorAll('.moving');
	    
	    movingBlocks.forEach(moveing =>{
	        moveing.classList.remove(type, 'moving');
	    })

	    //console.log(blocks[type][direction]);
	    blocks[type][direction].some(block => { 
	        const x = block[0] + location_left; // x = left값
	        const y = block[1] + location_top; // y= top값

	        const target = start.childNodes[y] ? start.childNodes[y].childNodes[0].childNodes[x] : null;
	      
	        const isAvailable = checkEmp(target);

	        if(isAvailable){
	            target.classList.add(type, 'moving');
	        }
	        else{
	            temp_block = {...move_item}

	            if(moveType === 'retry'){
	                clearInterval(downInterval);
	                showGameOverText();
	            }
	            setTimeout(()=>{
	                rendering('retry');
	                if(moveType === 'location_top' ){
	                    seizeBlcok();
	            }
	           }, 0)
	           return true;
	        }
	    })
	    move_item.location_left = location_left;
	    move_item.location_top = location_top; 
	    move_item.direction = direction;
	}        

	function checkEmp(target){
	    if( !target || target.classList.contains("seized")){
	        return false;
	    }
	    return true;
	}

	function moveBlock(moveType, val){
	    temp_block[moveType] += val;
	    rendering(moveType);
	}

	function moveDirection(){
	    const dir = temp_block.direction + 1 < 4 ? temp_block.direction + 1 : 0;
	    temp_block.direction = dir;
	    rendering();
	}

	function seizeBlcok(){
	    const movingBlocks = document.querySelectorAll('.moving');
	    
	    movingBlocks.forEach(moveing =>{
	        moveing.classList.remove('moving');
	        moveing.classList.add('seized');
	    })

	    check_match();
	}

	function check_match(){

	    const childNodes = start.childNodes;
	        childNodes.forEach(child => {

	            let matched = true;
	            child.children[0].childNodes.forEach(li=>{
	                if(!li.classList.contains("seized")){
	                    matched =false;
	                }
	            }) 
	            if(matched){
	                child.remove();
	                prependNewLine();
	                score++;
	                scoreDisplay.innerText = score;
	            }
	    })
	    generateNewBlock();
	}

	function showGameOverText(){
	    gameEnd.style.display = "block";

	}


	function generateNewBlock(){

	    clearInterval(downInterval);
	    downInterval = setInterval(()=>{
	        moveBlock('location_top', 1);
	    }, speed);


	    const blockArray = Object.entries(blocks);
	    const randomIndex = Math.floor(Math.random() * blockArray.length);


	    move_item.type = blockArray[randomIndex][0];
	    move_item.location_top = 0;
	    move_item.location_left = 0;
	    move_item.direction = 0;
	    temp_block = {...move_item};
	    rendering();
	}

	function dropBlock(){
	    clearInterval(downInterval);
	    downInterval = setInterval(()=>{
	        moveBlock("location_top", 1);
	    }, 10)
	}

	//event handling
	document.addEventListener('keydown', e=>{

	    switch(e.keyCode){
	        case 37:{
	            moveBlock("location_left", -1);
	            break;
	        }
	        case 39:{
	            moveBlock("location_left", 1);
	            break;
	        }
	        case 38:{
	            moveDirection();
	            break;
	        }
	        case 40:{
	            moveBlock("location_top", 1);
	            break;
	        }  
	        case 32:{
	            dropBlock();
	        }
	        default:
	            break;
	    }
	})

	StartBtn.addEventListener('click', ()=>{
	    gameStart.style.display = "none";

	    init();
	})

	reStartBtn.addEventListener('click', ()=>{

	    start.innerHTML = ""; // 게임판 초기화
	    init(); //새로운 게임 시작
	    gameEnd.style.display = "none"; //종료창 제거
	})
</script>
</body>
</html>

<!-- https://juni-official.tistory.com/138 -->