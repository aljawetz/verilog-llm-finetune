`timescale 1ns/1ps

module tb_VALU_ctrl;

    reg [9:0] vfunct_i;
    wire [2:0] VALUCtrl_o;

    // Instantiate the module under test (uut)
    VALU_ctrl uut (
        .vfunct_i(vfunct_i),
        .VALUCtrl_o(VALUCtrl_o)
    );

    initial begin
        // Test vector addition
        vfunct_i = 10'b000000_1_001; // Expected output: 3'b010
        #10;
        if (VALUCtrl_o !== 3'b010) begin
            $display("FAIL: Expected 3'b010 for vector addition, got %b", VALUCtrl_o);
            $finish;
        end

        // Test vector subtraction
        vfunct_i = 10'b010000_1_000; // Expected output: 3'b110
        #10;
        if (VALUCtrl_o !== 3'b110) begin
            $display("FAIL: Expected 3'b110 for vector subtraction, got %b", VALUCtrl_o);
            $finish;
        end

        // Test scalar multiplication
        vfunct_i = 10'b000000_1_111; // Expected output: 3'b000
        #10;
        if (VALUCtrl_o !== 3'b000) begin
            $display("FAIL: Expected 3'b000 for scalar multiplication, got %b", VALUCtrl_o);
            $finish;
        end

        // Test dot product
        vfunct_i = 10'b000000_1_110; // Expected output: 3'b001
        #10;
        if (VALUCtrl_o !== 3'b001) begin
            $display("FAIL: Expected 3'b001 for dot product, got %b", VALUCtrl_o);
            $finish;
        end

        // Test default case
        vfunct_i = 10'b111111_1_111; // Expected output: 3'b000 (default)
        #10;
        if (VALUCtrl_o !== 3'b000) begin
            $display("FAIL: Expected 3'b000 for default case, got %b", VALUCtrl_o);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule