`timescale 1ns/1ps

module tb_mux_8x1;

    reg [7:0] a;
    reg [2:0] s;
    wire y;

    // Instantiate the module under test (uut)
    mux_8x1 uut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select input 0
        a = 8'b10101010; // a = 0xAA
        s = 3'b000;     // Select a[0]
        #10;
        if (y !== a[0]) $display("FAIL: Test case 1 failed, expected %b, got %b", a[0], y);

        // Test case 2: Select input 1
        s = 3'b001;     // Select a[1]
        #10;
        if (y !== a[1]) $display("FAIL: Test case 2 failed, expected %b, got %b", a[1], y);

        // Test case 3: Select input 2
        s = 3'b010;     // Select a[2]
        #10;
        if (y !== a[2]) $display("FAIL: Test case 3 failed, expected %b, got %b", a[2], y);

        // Test case 4: Select input 3
        s = 3'b011;     // Select a[3]
        #10;
        if (y !== a[3]) $display("FAIL: Test case 4 failed, expected %b, got %b", a[3], y);

        // Test case 5: Select input 4
        s = 3'b100;     // Select a[4]
        #10;
        if (y !== a[4]) $display("FAIL: Test case 5 failed, expected %b, got %b", a[4], y);

        // Test case 6: Select input 5
        s = 3'b101;     // Select a[5]
        #10;
        if (y !== a[5]) $display("FAIL: Test case 6 failed, expected %b, got %b", a[5], y);

        // Test case 7: Select input 6
        s = 3'b110;     // Select a[6]
        #10;
        if (y !== a[6]) $display("FAIL: Test case 7 failed, expected %b, got %b", a[6], y);

        // Test case 8: Select input 7
        s = 3'b111;     // Select a[7]
        #10;
        if (y !== a[7]) $display("FAIL: Test case 8 failed, expected %b, got %b", a[7], y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule