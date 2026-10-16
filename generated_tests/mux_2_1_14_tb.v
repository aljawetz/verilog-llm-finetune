`timescale 1ns/1ps

module tb_mux_2_1;

    reg [1:0] I;
    reg S;
    wire Y;

    // Instantiate the module under test (uut)
    mux_2_1 uut (
        .Y(Y),
        .I(I),
        .S(S)
    );

    initial begin
        // Test case 1: S = 0, expect Y = I[0]
        I = 2'b01; // I[0] = 1, I[1] = 0
        S = 0;
        #10; // wait for 10 time units
        if (Y !== I[0]) begin
            $display("FAIL: Test case 1 failed, expected Y = %b, got Y = %b", I[0], Y);
            $finish;
        end

        // Test case 2: S = 1, expect Y = I[1]
        I = 2'b10; // I[0] = 0, I[1] = 1
        S = 1;
        #10; // wait for 10 time units
        if (Y !== I[1]) begin
            $display("FAIL: Test case 2 failed, expected Y = %b, got Y = %b", I[1], Y);
            $finish;
        end

        // Test case 3: S = 0, expect Y = I[0]
        I = 2'b11; // I[0] = 1, I[1] = 1
        S = 0;
        #10; // wait for 10 time units
        if (Y !== I[0]) begin
            $display("FAIL: Test case 3 failed, expected Y = %b, got Y = %b", I[0], Y);
            $finish;
        end

        // Test case 4: S = 1, expect Y = I[1]
        I = 2'b00; // I[0] = 0, I[1] = 0
        S = 1;
        #10; // wait for 10 time units
        if (Y !== I[1]) begin
            $display("FAIL: Test case 4 failed, expected Y = %b, got Y = %b", I[1], Y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule