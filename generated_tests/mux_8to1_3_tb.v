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
        // Test case 1: Select input 0
        d = 8'b10101010; // d = 0b10101010
        s = 3'b000;     // Select d[0]
        #10;
        if (y !== d[0]) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", d[0], y);
            $finish;
        end

        // Test case 2: Select input 1
        s = 3'b001;     // Select d[1]
        #10;
        if (y !== d[1]) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", d[1], y);
            $finish;
        end

        // Test case 3: Select input 2
        s = 3'b010;     // Select d[2]
        #10;
        if (y !== d[2]) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", d[2], y);
            $finish;
        end

        // Test case 4: Select input 3
        s = 3'b011;     // Select d[3]
        #10;
        if (y !== d[3]) begin
            $display("FAIL: Test case 4 failed, expected %b, got %b", d[3], y);
            $finish;
        end

        // Test case 5: Select input 4
        s = 3'b100;     // Select d[4]
        #10;
        if (y !== d[4]) begin
            $display("FAIL: Test case 5 failed, expected %b, got %b", d[4], y);
            $finish;
        end

        // Test case 6: Select input 5
        s = 3'b101;     // Select d[5]
        #10;
        if (y !== d[5]) begin
            $display("FAIL: Test case 6 failed, expected %b, got %b", d[5], y);
            $finish;
        end

        // Test case 7: Select input 6
        s = 3'b110;     // Select d[6]
        #10;
        if (y !== d[6]) begin
            $display("FAIL: Test case 7 failed, expected %b, got %b", d[6], y);
            $finish;
        end

        // Test case 8: Select input 7
        s = 3'b111;     // Select d[7]
        #10;
        if (y !== d[7]) begin
            $display("FAIL: Test case 8 failed, expected %b, got %b", d[7], y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule