`timescale 1ns / 1ps

module BCDtoFND_Decoder(
    input [3:0] i_value,
    input i_en,
    output [7:0] o_font     // f0~f7까지 폰트
    );

    reg [7:0] r_font;       // 얘도 마찬가지로 reg로 설정해줘야한다.
    assign o_font = r_font;

    always @(i_value or i_en) begin     // ()안에는 입력
        if (i_en) begin                 // enable이 1이면
            r_font = 8'hff;             // 8-bit 짜리 hexa로 ~
        end
        else begin                      // enable이 1이 아니라면
            r_font = 8'hff;             // 이게 없으면 case 안에 있는 경우가 없는 경우가 있기 때문에 원치 않는 Latch가 발생해 -> HW가 늘어나
                                        // Vivado에서 이거 없이 schematic을 확인해보면 원치않는 latch가 있음을 알 수 있다.
            case (i_value)              // 그 중에서도 i_value에 따라
                4'h0 : r_font = 8'hc0;
                4'h1 : r_font = 8'hf9;
                4'h2 : r_font = 8'ha4;
                4'h3 : r_font = 8'hb0;
                4'h4 : r_font = 8'h99;
                4'h5 : r_font = 8'h92;
                4'h6 : r_font = 8'h82;
                4'h7 : r_font = 8'hf8;
                4'h8 : r_font = 8'h80;
                4'h9 : r_font = 8'h90;
                4'ha : r_font = 8'h7f;
                // default : r_font = 8'hff; 여기에 넣어줘도 된다.
            endcase
        end
    end
endmodule
