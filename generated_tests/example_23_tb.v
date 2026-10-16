`timescale 1ns/1ps

module tb_example;

    reg [15:0] in0, in1, in2, in3;
    wire [17:0] sum;

    // Instantiate the module under test (uut)
    example uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sum(sum)
    );

    initial begin
        // Test case 1: Simple addition
        in0 = 16'h0001; // 1
        in1 = 16'h0002; // 2
        in2 = 16'h0003; // 3
        in3 = 16'h0004; // 4
        #10;
        if (sum !== 18'h000A) $display("FAIL: Test case 1 failed, expected 10, got %d", sum);

        // Test case 2: Maximum values
        in0 = 16'hFFFF; // 65535
        in1 = 16'hFFFF; // 65535
        in2 = 16'hFFFF; // 65535
        in3 = 16'hFFFF; // 65535
        #10;
        if (sum !== 18'h000000) $display("FAIL: Test case 2 failed, expected 0, got %d", sum); // Overflow case

        // Test case 3: Mixed values
        in0 = 16'h000A; // 10
        in1 = 16'h0005; // 5
        in2 = 16'h000F; // 15
        in3 = 16'h0001; // 1
        #10;
        if (sum !== 18'h0001F) $display("FAIL: Test case 3 failed, expected 31, got %d", sum);

        // Test case 4: All zeros
        in0 = 16'h0000; // 0
        in1 = 16'h0000; // 0
        in2 = 16'h0000; // 0
        in3 = 16'h0000; // 0
        #10;
        if (sum !== 18'h0000) $display("FAIL: Test case 4 failed, expected 0, got %d", sum);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule