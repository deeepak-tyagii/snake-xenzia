import up_handler from './up.js';
import drawSnake from "../snake/drawSnake.js";

const moveUp = () => {
	window.clearIntervalAsync(Number(document.getElementById('delay').innerHTML));
	if (true) {
		(async () => {
			await window.clearIntervalAsync(window.intervalId);
			
		})();
	}

	window.arrowUpPressedAlready = true;
	window.arrowDownPressedAlready = false;
	window.arrowLeftPressedAlready = false;
	window.arrowRightPressedAlready = false;

	window.intervalId = window.setIntervalAsync(() => {
		console.log('up');
		up_handler();
		drawSnake();
	}, Number(document.getElementById('delay').innerHTML));

}

export default moveUp;
