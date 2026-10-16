`timescale 1ns/1ps

module tb_MUX_using_case;

    reg [7:0] in;
    reg [2:0] s;
    wire y;

    // Instantiate the module under test (uut)
    MUX_using_case uut (
        .in(in),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select input 0
        in = 8'b10101010; // Input pattern
        s = 3'b000;      // Select line for input 0
        #10;
        if (y !== in[0]) $display("FAIL: Test case 1 failed, expected %b, got %b", in[0], y);

        // Test case 2: Select input 1
        s = 3'b001;      // Select line for input 1
        #10;
        if (y !== in[1]) $display("FAIL: Test case 2 failed, expected %b, got %b", in[1], y);

        // Test case 3: Select input 2
        s = 3'b010;      // Select line for input 2
        #10;
        if (y !== in[2]) $display("FAIL: Test case 3 failed, expected %b, got %b", in[2], y);

        // Test case 4: Select input 3
        s = 3'b011;      // Select line for input 3
        #10;
        if (y !== in[3]) $display("FAIL: Test case 4 failed, expected %b, got %b", in[3], y);

        // Test case 5: Select input 4
        s = 3'b100;      // Select line for input 4
        #10;
        if (y !== in[4]) $display("FAIL: Test case 5 failed, expected %b, got %b", in[4], y);

        // Test case 6: Select input 5
        s = 3'b101;      // Select line for input 5
        #10;
        if (y !== in[5]) $display("FAIL: Test case 6 failed, expected %b, got %b", in[5], y);

        // Test case 7: Select input 6
        s = 3'b110;      // Select line for input 6
        #10;
        if (y !== in[6]) $display("FAIL: Test case 7 failed, expected %b, got %b", in[6], y);

        // Test case 8: Select input 7
        s = 3'b111;      // Select line for input 7
        #10;
        if (y !== in[7]) $display("FAIL: Test case 8 failed, expected %b, got %b", in[7], y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule