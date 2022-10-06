`timescale 1ns / 1ps

module BCDtoFND(    // 그림에서 탑에 있는 모듈 2x4 Decoder랑 BCDtoFND Decoder를 묶은 모듈.
                    // Top module에다가 sub module을 packaging 하는 것!
    input [1:0] i_digitSelect,  // 0,1 이 들어감.
    input [3:0] i_value,
    input i_en,
    output [3:0] o_digit,
    output [7:0] o_fndFont
    );

    FND_Select_Decoder fndDigitDecoder(
        .i_digitSelect(i_digitSelect),        
        .i_en(i_en),                       
        .o_digit(o_digit)             
    );
    
    BCDtoFND_Decoder fndFontDecoder(  // Design Under T? 는 모듈화를 실체하는 것이기 때문에 이름이 달라야 한다.
        .i_value(i_value),
        .i_en(i_en),
        .o_font(o_fndFont)     // f0~f7까지 폰트
    );

endmodule
