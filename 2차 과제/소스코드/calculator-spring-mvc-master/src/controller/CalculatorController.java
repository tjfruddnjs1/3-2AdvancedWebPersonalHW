package controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.CalculatorModel;

@Controller
public class CalculatorController {

	private CalculatorService calcService = new CalculatorService();
	@RequestMapping("/")
	public String showHome() {
		return "calculator";
	}
	
	@RequestMapping(value = "/summation", method = RequestMethod.POST, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_JSON_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody double calcSum(@RequestBody CalculatorModel calculator) {

		return calcService.valueSum(calculator.getFirstValue(), calculator.getSecondValue());
	}

	@RequestMapping(value = "/subtraction", method = RequestMethod.POST, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_JSON_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody double calcSub(@RequestBody CalculatorModel calculator) {

		return calcService.valueSub(calculator.getFirstValue(), calculator.getSecondValue());
	}

	@RequestMapping(value = "/multiplication", method = RequestMethod.POST, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_JSON_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody double calcMulti(@RequestBody CalculatorModel calculator) {

		return calcService.valueMulti(calculator.getFirstValue(), calculator.getSecondValue());
	}

	@RequestMapping(value = "/division", method = RequestMethod.POST, consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_JSON_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody double calcDiv(@RequestBody CalculatorModel calculator) {
		return calcService.valueDiv(calculator.getFirstValue(), calculator.getSecondValue());
	}
}
