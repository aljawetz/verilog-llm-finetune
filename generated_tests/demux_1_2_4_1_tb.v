`timescale 1ns/1ps

module tb_demux_1_2_4;

    reg in;
    reg [1:0] S;
    wire [3:0] O;

    // Instantiate the module under test (uut)
    demux_1_2_4 uut (
        .in(in),
        .S(S),
        .O(O)
    );

    initial begin
        // Test case 1: Select 0, expect O[0] = in
        in = 1'b1; S = 2'b00; #10;
        if (O !== 4'b0001) begin
            $display("FAIL: Test case 1 failed, expected O = 0001, got O = %b", O);
            $finish;
        end

        // Test case 2: Select 1, expect O[1] = in
        in = 1'b1; S = 2'b01; #10;
        if (O !== 4'b0010) begin
            $display("FAIL: Test case 2 failed, expected O = 0010, got O = %b", O);
            $finish;
        end

        // Test case 3: Select 2, expect O[2] = in
        in = 1'b1; S = 2'b10; #10;
        if (O !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected O = 0100, got O = %b", O);
            $finish;
        end

        // Test case 4: Select 3, expect O[3] = in
        in = 1'b1; S = 2'b11; #10;
        if (O !== 4'b1000) begin
            $display("FAIL: Test case 4 failed, expected O = 1000, got O = %b", O);
            $finish;
        end

        // Test case 5: Check with in = 0
        in = 1'b0; S = 2'b00; #10;
        if (O !== 4'b0000) begin
            $display("FAIL: Test case 5 failed, expected O = 0000, got O = %b", O);
            $finish;
        end

        // Test case 6: Check with in = 0, select 1
        in = 1'b0; S = 2'b01; #10;
        if (O !== 4'b0000) begin
            $display("FAIL: Test case 6 failed, expected O = 0000, got O = %b", O);
            $finish;
        end

        // Test case 7: Check with in = 0, select 2
        in = 1'b0; S = 2'b10; #10;
        if (O !== 4'b0000) begin
            $display("FAIL: Test case 7 failed, expected O = 0000, got O = %b", O);
            $finish;
        end

        // Test case 8: Check with in = 0, select 3
        in = 1'b0; S = 2'b11; #10;
        if (O !== 4'b0000) begin
            $display("FAIL: Test case 8 failed, expected O = 0000, got O = %b", O);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule