`timescale 1ns/1ps

module tb_mux_4to1;

    reg [7:0] d;
    reg [2:0] s;
    wire y;

    // Instantiate the module under test
    mux_4to1 uut (
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select input 0
        d = 8'b10101010; // Input data
        s = 3'b000;     // Select line
        #10;            // Wait for 10 time units
        if (y !== d[0]) begin
            $display("FAIL: Expected %b, got %b for select %b", d[0], y, s);
            $finish;
        end

        // Test case 2: Select input 1
        s = 3'b001;     // Select line
        #10;            // Wait for 10 time units
        if (y !== d[1]) begin
            $display("FAIL: Expected %b, got %b for select %b", d[1], y, s);
            $finish;
        end

        // Test case 3: Select input 2
        s = 3'b010;     // Select line
        #10;            // Wait for 10 time units
        if (y !== d[2]) begin
            $display("FAIL: Expected %b, got %b for select %b", d[2], y, s);
            $finish;
        end

        // Test case 4: Select input 3
        s = 3'b011;     // Select line
        #10;            // Wait for 10 time units
        if (y !== d[3]) begin
            $display("FAIL: Expected %b, got %b for select %b", d[3], y, s);
            $finish;
        end

        // Test case 5: Select input 4
        s = 3'b100;     // Select line
        #10;            // Wait for 10 time units
        if (y !== d[4]) begin
            $display("FAIL: Expected %b, got %b for select %b", d[4], y, s);
            $finish;
        end

        // Test case 6: Select input 5
        s = 3'b101;     // Select line
        #10;            // Wait for 10 time units
        if (y !== d[5]) begin
            $display("FAIL: Expected %b, got %b for select %b", d[5], y, s);
            $finish;
        end

        // Test case 7: Select input 6
        s = 3'b110;     // Select line
        #10;            // Wait for 10 time units
        if (y !== d[6]) begin
            $display("FAIL: Expected %b, got %b for select %b", d[6], y, s);
            $finish;
        end

        // Test case 8: Select input 7
        s = 3'b111;     // Select line
        #10;            // Wait for 10 time units
        if (y !== d[7]) begin
            $display("FAIL: Expected %b, got %b for select %b", d[7], y, s);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule