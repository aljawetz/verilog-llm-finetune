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
        // Test case 1: Select 0
        d = 8'b10101010; // Input data
        s = 3'b000;     // Select line
        #10;
        if (y !== d[0]) begin
            $display("FAIL: Test case 1 failed, expected %b but got %b", d[0], y);
            $finish;
        end

        // Test case 2: Select 1
        s = 3'b001;     // Select line
        #10;
        if (y !== d[1]) begin
            $display("FAIL: Test case 2 failed, expected %b but got %b", d[1], y);
            $finish;
        end

        // Test case 3: Select 2
        s = 3'b010;     // Select line
        #10;
        if (y !== d[2]) begin
            $display("FAIL: Test case 3 failed, expected %b but got %b", d[2], y);
            $finish;
        end

        // Test case 4: Select 3
        s = 3'b011;     // Select line
        #10;
        if (y !== d[3]) begin
            $display("FAIL: Test case 4 failed, expected %b but got %b", d[3], y);
            $finish;
        end

        // Test case 5: Select 4
        s = 3'b100;     // Select line
        #10;
        if (y !== d[4]) begin
            $display("FAIL: Test case 5 failed, expected %b but got %b", d[4], y);
            $finish;
        end

        // Test case 6: Select 5
        s = 3'b101;     // Select line
        #10;
        if (y !== d[5]) begin
            $display("FAIL: Test case 6 failed, expected %b but got %b", d[5], y);
            $finish;
        end

        // Test case 7: Select 6
        s = 3'b110;     // Select line
        #10;
        if (y !== d[6]) begin
            $display("FAIL: Test case 7 failed, expected %b but got %b", d[6], y);
            $finish;
        end

        // Test case 8: Select 7
        s = 3'b111;     // Select line
        #10;
        if (y !== d[7]) begin
            $display("FAIL: Test case 8 failed, expected %b but got %b", d[7], y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule