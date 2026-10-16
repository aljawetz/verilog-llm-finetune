`timescale 1ns/1ps

module tb_mux_4to1;

    reg [7:0] d;
    reg [2:0] s;
    wire y;

    // Instantiate the module under test (uut)
    mux_4to1 uut (
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select d[0]
        d = 8'b00000001; // d = 1
        s = 3'b000;     // select 0
        #10;
        if (y !== d[0]) $display("FAIL: Test case 1 failed, expected %b but got %b", d[0], y);

        // Test case 2: Select d[1]
        d = 8'b00000010; // d = 2
        s = 3'b001;     // select 1
        #10;
        if (y !== d[1]) $display("FAIL: Test case 2 failed, expected %b but got %b", d[1], y);

        // Test case 3: Select d[2]
        d = 8'b00000100; // d = 4
        s = 3'b010;     // select 2
        #10;
        if (y !== d[2]) $display("FAIL: Test case 3 failed, expected %b but got %b", d[2], y);

        // Test case 4: Select d[3]
        d = 8'b00001000; // d = 8
        s = 3'b011;     // select 3
        #10;
        if (y !== d[3]) $display("FAIL: Test case 4 failed, expected %b but got %b", d[3], y);

        // Test case 5: Select d[4]
        d = 8'b00010000; // d = 16
        s = 3'b100;     // select 4
        #10;
        if (y !== d[4]) $display("FAIL: Test case 5 failed, expected %b but got %b", d[4], y);

        // Test case 6: Select d[5]
        d = 8'b00100000; // d = 32
        s = 3'b101;     // select 5
        #10;
        if (y !== d[5]) $display("FAIL: Test case 6 failed, expected %b but got %b", d[5], y);

        // Test case 7: Select d[6]
        d = 8'b01000000; // d = 64
        s = 3'b110;     // select 6
        #10;
        if (y !== d[6]) $display("FAIL: Test case 7 failed, expected %b but got %b", d[6], y);

        // Test case 8: Select d[7]
        d = 8'b10000000; // d = 128
        s = 3'b111;     // select 7
        #10;
        if (y !== d[7]) $display("FAIL: Test case 8 failed, expected %b but got %b", d[7], y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule