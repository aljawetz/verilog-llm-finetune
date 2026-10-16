`timescale 1ns/1ps

module tb_msrv32_immediate_adder;

    reg [31:0] pc_in;
    reg [31:0] rs1_in;
    reg [31:0] imm_in;
    reg iadder_src_in;
    wire [31:0] iadder_out;

    // Instantiate the module under test (uut)
    msrv32_immediate_adder uut (
        .pc_in(pc_in),
        .rs1_in(rs1_in),
        .imm_in(imm_in),
        .iadder_src_in(iadder_src_in),
        .iadder_out(iadder_out)
    );

    initial begin
        // Test case 1: iadder_src_in = 0 (pc_in + imm_in)
        pc_in = 32'h00000010; // Example PC value
        rs1_in = 32'h00000020; // Example RS1 value
        imm_in = 32'h00000005; // Immediate value
        iadder_src_in = 0;     // Select PC
        #10;                    // Wait for a time
        if (iadder_out !== (pc_in + imm_in)) begin
            $display("FAIL: Test case 1 failed, expected %h but got %h", (pc_in + imm_in), iadder_out);
            $finish;
        end

        // Test case 2: iadder_src_in = 1 (rs1_in + imm_in)
        pc_in = 32'h00000010; // Reset PC value
        rs1_in = 32'h00000020; // Reset RS1 value
        imm_in = 32'h00000005; // Reset Immediate value
        iadder_src_in = 1;     // Select RS1
        #10;                    // Wait for a time
        if (iadder_out !== (rs1_in + imm_in)) begin
            $display("FAIL: Test case 2 failed, expected %h but got %h", (rs1_in + imm_in), iadder_out);
            $finish;
        end

        // Test case 3: Check with different values
        pc_in = 32'h000000FF; // New PC value
        rs1_in = 32'h00000001; // New RS1 value
        imm_in = 32'h00000002; // New Immediate value
        iadder_src_in = 0;     // Select PC
        #10;                    // Wait for a time
        if (iadder_out !== (pc_in + imm_in)) begin
            $display("FAIL: Test case 3 failed, expected %h but got %h", (pc_in + imm_in), iadder_out);
            $finish;
        end

        // Test case 4: Check with different values for RS1
        iadder_src_in = 1;     // Select RS1
        #10;                    // Wait for a time
        if (iadder_out !== (rs1_in + imm_in)) begin
            $display("FAIL: Test case 4 failed, expected %h but got %h", (rs1_in + imm_in), iadder_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule