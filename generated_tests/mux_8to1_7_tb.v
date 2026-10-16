`timescale 1ns/1ps

module tb_mux_8to1;

    reg [7:0] d;
    reg [2:0] s;
    wire y;

    // Instantiate the module under test (uut)
    mux_8to1 uut (
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select input 0
        d = 8'b00000001; // d[0] = 1
        s = 3'b000;     // Select d[0]
        #10;
        if (y !== d[0]) begin
            $display("FAIL: Test case 1 failed, expected %b but got %b", d[0], y);
            $finish;
        end

        // Test case 2: Select input 1
        d = 8'b00000010; // d[1] = 1
        s = 3'b001;     // Select d[1]
        #10;
        if (y !== d[1]) begin
            $display("FAIL: Test case 2 failed, expected %b but got %b", d[1], y);
            $finish;
        end

        // Test case 3: Select input 2
        d = 8'b00000100; // d[2] = 1
        s = 3'b010;     // Select d[2]
        #10;
        if (y !== d[2]) begin
            $display("FAIL: Test case 3 failed, expected %b but got %b", d[2], y);
            $finish;
        end

        // Test case 4: Select input 3
        d = 8'b00001000; // d[3] = 1
        s = 3'b011;     // Select d[3]
        #10;
        if (y !== d[3]) begin
            $display("FAIL: Test case 4 failed, expected %b but got %b", d[3], y);
            $finish;
        end

        // Test case 5: Select input 4
        d = 8'b00010000; // d[4] = 1
        s = 3'b100;     // Select d[4]
        #10;
        if (y !== d[4]) begin
            $display("FAIL: Test case 5 failed, expected %b but got %b", d[4], y);
            $finish;
        end

        // Test case 6: Select input 5
        d = 8'b00100000; // d[5] = 1
        s = 3'b101;     // Select d[5]
        #10;
        if (y !== d[5]) begin
            $display("FAIL: Test case 6 failed, expected %b but got %b", d[5], y);
            $finish;
        end

        // Test case 7: Select input 6
        d = 8'b01000000; // d[6] = 1
        s = 3'b110;     // Select d[6]
        #10;
        if (y !== d[6]) begin
            $display("FAIL: Test case 7 failed, expected %b but got %b", d[6], y);
            $finish;
        end

        // Test case 8: Select input 7
        d = 8'b10000000; // d[7] = 1
        s = 3'b111;     // Select d[7]
        #10;
        if (y !== d[7]) begin
            $display("FAIL: Test case 8 failed, expected %b but got %b", d[7], y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule