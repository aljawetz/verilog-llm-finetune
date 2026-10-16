`timescale 1ns/1ps

module tb_mux_8x1;

    reg [7:0] I;
    reg [2:0] sel;
    wire Y;

    // Instantiate the module under test (uut)
    mux_8x1 uut (
        .I(I),
        .sel(sel),
        .Y(Y)
    );

    initial begin
        // Test case 1: Select input 0
        I = 8'b10101010; // Input pattern
        sel = 3'b000;    // Select first bit
        #10;             // Wait for 10 time units
        if (Y !== I[0]) $display("FAIL: Test case 1 failed, expected %b but got %b", I[0], Y);

        // Test case 2: Select input 1
        sel = 3'b001;    // Select second bit
        #10;
        if (Y !== I[1]) $display("FAIL: Test case 2 failed, expected %b but got %b", I[1], Y);

        // Test case 3: Select input 2
        sel = 3'b010;    // Select third bit
        #10;
        if (Y !== I[2]) $display("FAIL: Test case 3 failed, expected %b but got %b", I[2], Y);

        // Test case 4: Select input 3
        sel = 3'b011;    // Select fourth bit
        #10;
        if (Y !== I[3]) $display("FAIL: Test case 4 failed, expected %b but got %b", I[3], Y);

        // Test case 5: Select input 4
        sel = 3'b100;    // Select fifth bit
        #10;
        if (Y !== I[4]) $display("FAIL: Test case 5 failed, expected %b but got %b", I[4], Y);

        // Test case 6: Select input 5
        sel = 3'b101;    // Select sixth bit
        #10;
        if (Y !== I[5]) $display("FAIL: Test case 6 failed, expected %b but got %b", I[5], Y);

        // Test case 7: Select input 6
        sel = 3'b110;    // Select seventh bit
        #10;
        if (Y !== I[6]) $display("FAIL: Test case 7 failed, expected %b but got %b", I[6], Y);

        // Test case 8: Select input 7
        sel = 3'b111;    // Select eighth bit
        #10;
        if (Y !== I[7]) $display("FAIL: Test case 8 failed, expected %b but got %b", I[7], Y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule