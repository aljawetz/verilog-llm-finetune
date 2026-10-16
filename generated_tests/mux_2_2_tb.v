`timescale 1ns/1ps

module tb_mux_2;

    reg [3:0] d;
    reg [1:0] s;
    wire y;

    // Instantiate the module under test (uut)
    mux_2 uut (
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select d[0]
        d = 4'b1010; // d = 10
        s = 2'b00;   // Select d[0]
        #10;
        if (y !== d[0]) begin
            $display("FAIL: Test case 1 failed, expected y = %b, got y = %b", d[0], y);
            $finish;
        end

        // Test case 2: Select d[1]
        s = 2'b01;   // Select d[1]
        #10;
        if (y !== d[1]) begin
            $display("FAIL: Test case 2 failed, expected y = %b, got y = %b", d[1], y);
            $finish;
        end

        // Test case 3: Select d[2]
        s = 2'b10;   // Select d[2]
        #10;
        if (y !== d[2]) begin
            $display("FAIL: Test case 3 failed, expected y = %b, got y = %b", d[2], y);
            $finish;
        end

        // Test case 4: Select d[3]
        s = 2'b11;   // Select d[3]
        #10;
        if (y !== d[3]) begin
            $display("FAIL: Test case 4 failed, expected y = %b, got y = %b", d[3], y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule