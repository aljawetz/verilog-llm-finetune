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
        // Test case 1: Select 0
        a = 8'b10101010; // Input data
        s = 3'b000;     // Select line
        #10;            // Wait for 10 time units
        if (y !== a[0]) $display("FAIL: Expected y=%b, got y=%b for s=%b", a[0], y, s);

        // Test case 2: Select 1
        s = 3'b001;     
        #10;            
        if (y !== a[1]) $display("FAIL: Expected y=%b, got y=%b for s=%b", a[1], y, s);

        // Test case 3: Select 2
        s = 3'b010;     
        #10;            
        if (y !== a[2]) $display("FAIL: Expected y=%b, got y=%b for s=%b", a[2], y, s);

        // Test case 4: Select 3
        s = 3'b011;     
        #10;            
        if (y !== a[3]) $display("FAIL: Expected y=%b, got y=%b for s=%b", a[3], y, s);

        // Test case 5: Select 4
        s = 3'b100;     
        #10;            
        if (y !== a[4]) $display("FAIL: Expected y=%b, got y=%b for s=%b", a[4], y, s);

        // Test case 6: Select 5
        s = 3'b101;     
        #10;            
        if (y !== a[5]) $display("FAIL: Expected y=%b, got y=%b for s=%b", a[5], y, s);

        // Test case 7: Select 6
        s = 3'b110;     
        #10;            
        if (y !== a[6]) $display("FAIL: Expected y=%b, got y=%b for s=%b", a[6], y, s);

        // Test case 8: Select 7
        s = 3'b111;     
        #10;            
        if (y !== a[7]) $display("FAIL: Expected y=%b, got y=%b for s=%b", a[7], y, s);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule