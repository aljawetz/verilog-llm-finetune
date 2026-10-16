`timescale 1ns/1ps

module tb_mux_8to1;

    reg [7:0] d;
    reg [2:0] s;
    wire y;

    // Instantiate the module under test
    mux_8to1 uut (
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select d[0]
        d = 8'b10101010; // Input vector
        s = 3'b000;     // Select line for d[0]
        #10;            // Wait for 10 time units
        if (y !== d[0]) $display("FAIL: Expected y = %b, got y = %b for s = %b", d[0], y, s);

        // Test case 2: Select d[1]
        s = 3'b001;     // Select line for d[1]
        #10;
        if (y !== d[1]) $display("FAIL: Expected y = %b, got y = %b for s = %b", d[1], y, s);

        // Test case 3: Select d[2]
        s = 3'b010;     // Select line for d[2]
        #10;
        if (y !== d[2]) $display("FAIL: Expected y = %b, got y = %b for s = %b", d[2], y, s);

        // Test case 4: Select d[3]
        s = 3'b011;     // Select line for d[3]
        #10;
        if (y !== d[3]) $display("FAIL: Expected y = %b, got y = %b for s = %b", d[3], y, s);

        // Test case 5: Select d[4]
        s = 3'b100;     // Select line for d[4]
        #10;
        if (y !== d[4]) $display("FAIL: Expected y = %b, got y = %b for s = %b", d[4], y, s);

        // Test case 6: Select d[5]
        s = 3'b101;     // Select line for d[5]
        #10;
        if (y !== d[5]) $display("FAIL: Expected y = %b, got y = %b for s = %b", d[5], y, s);

        // Test case 7: Select d[6]
        s = 3'b110;     // Select line for d[6]
        #10;
        if (y !== d[6]) $display("FAIL: Expected y = %b, got y = %b for s = %b", d[6], y, s);

        // Test case 8: Select d[7]
        s = 3'b111;     // Select line for d[7]
        #10;
        if (y !== d[7]) $display("FAIL: Expected y = %b, got y = %b for s = %b", d[7], y, s);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule