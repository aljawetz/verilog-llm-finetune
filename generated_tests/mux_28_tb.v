`timescale 1ns/1ps

module tb_mux;

    reg [3:0] inp;
    reg [1:0] sel;
    wire out;

    // Instantiate the module under test (uut)
    mux uut (
        .inp(inp),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: Select 0, expect out = inp[0]
        inp = 4'b1010; // inp = 10
        sel = 2'b00;   // select first input
        #10;
        if (out !== inp[0]) begin
            $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", inp[0], out);
            $finish;
        end

        // Test case 2: Select 1, expect out = inp[1]
        sel = 2'b01;   // select second input
        #10;
        if (out !== inp[1]) begin
            $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", inp[1], out);
            $finish;
        end

        // Test case 3: Select 2, expect out = inp[2]
        sel = 2'b10;   // select third input
        #10;
        if (out !== inp[2]) begin
            $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", inp[2], out);
            $finish;
        end

        // Test case 4: Select 3, expect out = inp[3]
        sel = 2'b11;   // select fourth input
        #10;
        if (out !== inp[3]) begin
            $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", inp[3], out);
            $finish;
        end

        // Test case 5: Select out of range, expect out = 0
        sel = 2'bxx;   // invalid select
        #10;
        if (out !== 1'b0) begin
            $display("FAIL: Test case 5 failed, expected out = 0, got out = %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule