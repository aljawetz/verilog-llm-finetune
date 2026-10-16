`timescale 1ns/1ps

module tb_mux_2x1;

    parameter WIDTH = 4;
    reg [WIDTH-1:0] IN0;
    reg [WIDTH-1:0] IN1;
    reg SEL;
    wire [WIDTH-1:0] OUT0;

    // Instantiate the module under test
    mux_2x1 #(WIDTH) uut (
        .IN0(IN0),
        .IN1(IN1),
        .SEL(SEL),
        .OUT0(OUT0)
    );

    initial begin
        // Test case 1: SEL = 0, expect OUT0 = IN0
        IN0 = 4'b1010; IN1 = 4'b0101; SEL = 0;
        #10;
        if (OUT0 !== IN0) begin
            $display("FAIL: Test case 1 failed, expected OUT0 = %b, got OUT0 = %b", IN0, OUT0);
            $finish;
        end

        // Test case 2: SEL = 1, expect OUT0 = IN1
        IN0 = 4'b1010; IN1 = 4'b0101; SEL = 1;
        #10;
        if (OUT0 !== IN1) begin
            $display("FAIL: Test case 2 failed, expected OUT0 = %b, got OUT0 = %b", IN1, OUT0);
            $finish;
        end

        // Test case 3: Change inputs and test again
        IN0 = 4'b1111; IN1 = 4'b0000; SEL = 0;
        #10;
        if (OUT0 !== IN0) begin
            $display("FAIL: Test case 3 failed, expected OUT0 = %b, got OUT0 = %b", IN0, OUT0);
            $finish;
        end

        // Test case 4: Change inputs and test again
        IN0 = 4'b1111; IN1 = 4'b0000; SEL = 1;
        #10;
        if (OUT0 !== IN1) begin
            $display("FAIL: Test case 4 failed, expected OUT0 = %b, got OUT0 = %b", IN1, OUT0);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule