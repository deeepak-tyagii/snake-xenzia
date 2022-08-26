import left_handler from './left.js';
import drawSnake from "../snake/drawSnake.js";

const moveLeft = () => {
	if (true) {
		(async () => {
			await window.clearIntervalAsync(window.intervalId);
			
		})();
	}

	window.arrowUpPressedAlready = false;
	window.arrowDownPressedAlready = false;
	window.arrowLeftPressedAlready = true;
	window.arrowRightPressedAlready = false;

	window.intervalId = window.setIntervalAsync(() => {
		console.log('left');
		left_handler();
		drawSnake();
	}, Number(document.getElementById('delay').innerHTML));

}

export default moveLeft;
