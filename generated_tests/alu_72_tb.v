`timescale 1ns/1ps

module tb_alu;

    reg [7:0] a;
    reg [7:0] b;
    reg sel;
    wire [7:0] alu_result;

    // Instantiate the ALU module
    alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .alu_result(alu_result)
    );

    initial begin
        // Test case 1: sel = 0, a = 8'hFF, b = 8'h0F (AND operation)
        a = 8'hFF; b = 8'h0F; sel = 0;
        #10;
        if (alu_result !== (a & b)) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: sel = 1, a = 8'hAA, b = 8'h55 (should return a)
        a = 8'hAA; b = 8'h55; sel = 1;
        #10;
        if (alu_result !== a) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: sel = 0, a = 8'h00, b = 8'h00 (AND operation)
        a = 8'h00; b = 8'h00; sel = 0;
        #10;
        if (alu_result !== (a & b)) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: sel = 1, a = 8'h7F, b = 8'hFF (should return a)
        a = 8'h7F; b = 8'hFF; sel = 1;
        #10;
        if (alu_result !== a) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: sel = 0, a = 8'hF0, b = 8'h0F (AND operation)
        a = 8'hF0; b = 8'h0F; sel = 0;
        #10;
        if (alu_result !== (a & b)) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule