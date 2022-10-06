`timescale 1ns / 1ps

module FND_Select_Decoder(
    input [1:0] i_digitSelect,        // 입력 2개, digit select (2x4 decoder에서)
    input i_en,                       // 입력, enable
    output [3:0] o_digit              // 출력 4개 output digit
    );

    reg [3:0] r_digit;                // input, output은 wire tpye이 디폴트야. 즉, 그냥 전선이기 때문에 메모리 기능이 없어.
                                      // 그렇기 때문에 reg 타입으로 지정해줘야한다. reg가 메모리 기능이 있는거야.
    assign o_digit = r_digit;

    always @(i_digitSelect or i_en) begin     // @(), 즉 입력을 계속 바라보고 있다. // or 대신 , 사용해도 된다.
        if (i_en) begin
            r_digit = 4'b1111;                // enable이 1이면 4-bit 1111을 o_digit에 넣어라
        end
        else begin                            // 그렇지 않으면(enable이 1이 아니면)
            case (i_digitSelect)              // i_digitSelect 값에 따른 다음의 값들을 넣어라.
                2'h0 : r_digit = 4'b1110;     // 입력 2-bt가 0일 때, 4-bit ~
                2'h1 : r_digit = 4'b1101;
                2'h2 : r_digit = 4'b1011;
                2'h3 : r_digit = 4'b0111;                
            endcase                           // case 뒤에는 endcase가 나와야한다.
        end
    end
endmodule
