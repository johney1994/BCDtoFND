`timescale 1ns / 1ps

module tb_BCDtoFND();

    reg [1:0] i_digitSelect;
    reg i_en;
    wire [3:0] o_digit;

    reg [1:0] i_value;
    wire [7:0] o_digit;
    
    FND_Select_Decoder dut(
        .i_digitSelect(i_digitSelect),        
        .i_en(i_en),                       
        .o_digit(o_digit)             
    );
    
    BCDtoFND_Decoder dut1(  // Design Under T? 는 모듈화를 실체하는 것이기 때문에 이름이 달라야 한다.
        .i_value(i_value),
        .i_en(i_en),
        .o_font(o_font)     // f0~f7까지 폰트
    );

    initial begin
        #00 i_en = 1'b1; i_digitSelect = 2'b00;     // enable이 1일때
        #10 i_en = 1'b1; i_digitSelect = 2'b01;
        #10 i_en = 1'b1; i_digitSelect = 2'b10;
        #10 i_en = 1'b1; i_digitSelect = 2'b11;

        #10 i_en = 1'b0; i_digitSelect = 2'b00; i_value = 4'h0;     // enable이 0일때
        #10 i_en = 1'b0; i_digitSelect = 2'b01; i_value = 4'h5;
        #10 i_en = 1'b0; i_digitSelect = 2'b10; i_value = 4'ha;
        #10 i_en = 1'b0; i_digitSelect = 2'b11; i_value = 4'hf;
        #10 i_en = 1'b0; i_digitSelect = 2'b11; i_value = 4'h2;     
        #10 i_en = 1'b0; i_digitSelect = 2'b11; i_value = 4'h3;
        #10 i_en = 1'b0; i_digitSelect = 2'b11; i_value = 4'h4;
        #10 i_en = 1'b0; i_digitSelect = 2'b11; i_value = 4'h8;

        #10 $finish;
    end

endmodule