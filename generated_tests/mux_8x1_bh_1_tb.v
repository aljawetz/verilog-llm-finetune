`timescale 1ns/1ps

module tb_mux_8x1_bh;

    reg [7:0] i;
    reg [2:0] s;
    wire y;

    // Instantiate the module under test (uut)
    mux_8x1_bh uut (
        .y(y),
        .i(i),
        .s(s)
    );

    initial begin
        // Test case 1: Select input 0
        i = 8'b00000001; // i[0] = 1
        s = 3'b000;     // Select i[0]
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);
            $finish;
        end

        // Test case 2: Select input 1
        i = 8'b00000010; // i[1] = 1
        s = 3'b001;     // Select i[1]
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);
            $finish;
        end

        // Test case 3: Select input 2
        i = 8'b00000100; // i[2] = 1
        s = 3'b010;     // Select i[2]
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 3 failed, expected y=1, got y=%b", y);
            $finish;
        end

        // Test case 4: Select input 3
        i = 8'b00001000; // i[3] = 1
        s = 3'b011;     // Select i[3]
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);
            $finish;
        end

        // Test case 5: Select input 4
        i = 8'b00010000; // i[4] = 1
        s = 3'b100;     // Select i[4]
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 5 failed, expected y=1, got y=%b", y);
            $finish;
        end

        // Test case 6: Select input 5
        i = 8'b00100000; // i[5] = 1
        s = 3'b101;     // Select i[5]
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 6 failed, expected y=1, got y=%b", y);
            $finish;
        end

        // Test case 7: Select input 6
        i = 8'b01000000; // i[6] = 1
        s = 3'b110;     // Select i[6]
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 7 failed, expected y=1, got y=%b", y);
            $finish;
        end

        // Test case 8: Select input 7
        i = 8'b10000000; // i[7] = 1
        s = 3'b111;     // Select i[7]
        #10;
        if (y !== 1'b1) begin
            $display("FAIL: Test case 8 failed, expected y=1, got y=%b", y);
            $finish;
        end

        // Test case 9: Check all inputs are zero
        i = 8'b00000000; // All inputs are 0
        s = 3'b000;     // Select i[0]
        #10;
        if (y !== 1'b0) begin
            $display("FAIL: Test case 9 failed, expected y=0, got y=%b", y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule