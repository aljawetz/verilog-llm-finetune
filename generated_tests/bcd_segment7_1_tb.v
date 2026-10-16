`timescale 1ns/1ps

module tb_bcd_segment7;

reg A, B, C, D;
wire [6:0] seg7;
reg [3:0] i;

bcd_segment7 uut (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .seg7(seg7)
);

initial begin
    // Test valid BCD inputs
    for (i = 0; i < 10; i = i + 1) begin
        {A, B, C, D} = i;
        #10; // Wait for output to settle
        case (i)
            0: if (seg7 !== 7'b1000000) $display("FAIL: BCD 0 output incorrect");
            1: if (seg7 !== 7'b1111001) $display("FAIL: BCD 1 output incorrect");
            2: if (seg7 !== 7'b0100100) $display("FAIL: BCD 2 output incorrect");
            3: if (seg7 !== 7'b0110000) $display("FAIL: BCD 3 output incorrect");
            4: if (seg7 !== 7'b0011001) $display("FAIL: BCD 4 output incorrect");
            5: if (seg7 !== 7'b0010010) $display("FAIL: BCD 5 output incorrect");
            6: if (seg7 !== 7'b0000010) $display("FAIL: BCD 6 output incorrect");
            7: if (seg7 !== 7'b1111000) $display("FAIL: BCD 7 output incorrect");
            8: if (seg7 !== 7'b0000000) $display("FAIL: BCD 8 output incorrect");
            9: if (seg7 !== 7'b0010000) $display("FAIL: BCD 9 output incorrect");
        endcase
    end

    // Test invalid BCD inputs
    {A, B, C, D} = 4'b1010; #10; // 10
    if (seg7 !== 7'b0000000) $display("FAIL: Invalid BCD 10 output incorrect");

    {A, B, C, D} = 4'b1111; #10; // 15
    if (seg7 !== 7'b0000000) $display("FAIL: Invalid BCD 15 output incorrect");

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule