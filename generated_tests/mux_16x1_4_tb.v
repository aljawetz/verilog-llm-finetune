`timescale 1ns/1ps

module tb_mux_16x1;

    reg [16:0] a;
    reg [3:0] s;
    wire y;

    // Instantiate the module under test
    mux_16x1 uut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select input 0
        a = 17'b00000000000000001; // a[0] = 1
        s = 4'b0000; // Select a[0]
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 1 failed, expected y=1, got y=%b", y);

        // Test case 2: Select input 1
        a = 17'b00000000000000010; // a[1] = 1
        s = 4'b0001; // Select a[1]
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 2 failed, expected y=0, got y=%b", y);

        // Test case 3: Select input 2
        a = 17'b00000000000000100; // a[2] = 1
        s = 4'b0010; // Select a[2]
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 3 failed, expected y=0, got y=%b", y);

        // Test case 4: Select input 3
        a = 17'b00000000000001000; // a[3] = 1
        s = 4'b0011; // Select a[3]
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 4 failed, expected y=0, got y=%b", y);

        // Test case 5: Select input 4
        a = 17'b00000000000010000; // a[4] = 1
        s = 4'b0100; // Select a[4]
        #10;
        if (y !== 1'b0) $display("FAIL: Test case 5 failed, expected y=0, got y=%b", y);

        // Test case 6: Select input 15
        a = 17'b00000000000000000; // All inputs are 0
        a[15] = 1; // a[15] = 1
        s = 4'b1111; // Select a[15]
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 6 failed, expected y=1, got y=%b", y);

        // Test case 7: Select input 14
        a = 17'b00000000000000000; // All inputs are 0
        a[14] = 1; // a[14] = 1
        s = 4'b1110; // Select a[14]
        #10;
        if (y !== 1'b1) $display("FAIL: Test case 7 failed, expected y=1, got y=%b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule