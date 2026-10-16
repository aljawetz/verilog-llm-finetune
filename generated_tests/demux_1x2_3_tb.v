`timescale 1ns/1ps

module tb_demux_1x2;

    parameter WIDTH = 4;
    reg [WIDTH-1:0] IN0;
    reg SEL;
    wire [WIDTH-1:0] OUT0;
    wire [WIDTH-1:0] OUT1;

    // Instantiate the module under test
    demux_1x2 #(WIDTH) uut (
        .IN0(IN0),
        .SEL(SEL),
        .OUT0(OUT0),
        .OUT1(OUT1)
    );

    initial begin
        // Test case 1: SEL = 0, expect OUT0 = IN0, OUT1 = 0
        IN0 = 4'b1010; // Input value
        SEL = 0;      // Select OUT0
        #10;          // Wait for a time
        if (OUT0 !== IN0 || OUT1 !== 4'b0000) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: SEL = 1, expect OUT0 = 0, OUT1 = IN0
        SEL = 1;      // Select OUT1
        #10;          // Wait for a time
        if (OUT0 !== 4'b0000 || OUT1 !== IN0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Change IN0 while SEL = 0
        IN0 = 4'b1111; // New input value
        SEL = 0;      // Select OUT0
        #10;          // Wait for a time
        if (OUT0 !== IN0 || OUT1 !== 4'b0000) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Change IN0 while SEL = 1
        SEL = 1;      // Select OUT1
        #10;          // Wait for a time
        if (OUT0 !== 4'b0000 || OUT1 !== IN0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Check with another input
        IN0 = 4'b0011; // Another input value
        SEL = 0;      // Select OUT0
        #10;          // Wait for a time
        if (OUT0 !== IN0 || OUT1 !== 4'b0000) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Final check with SEL = 1
        SEL = 1;      // Select OUT1
        #10;          // Wait for a time
        if (OUT0 !== 4'b0000 || OUT1 !== IN0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule