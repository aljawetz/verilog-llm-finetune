`timescale 1ns/1ps

module tb_Store_Unit;

    reg [31:0] data_in;
    reg sb;
    reg sh;
    wire [31:0] data_out;

    // Instantiate the module under test
    Store_Unit uut (
        .data_in(data_in),
        .sb(sb),
        .sh(sh),
        .data_out(data_out)
    );

    initial begin
        // Test case 1: Store word (sb=0, sh=0)
        data_in = 32'hAABBCCDD; // Input data
        sb = 0; 
        sh = 0; 
        #10;
        if (data_out !== 32'hAABBCCDD) begin
            $display("FAIL: Test case 1 failed, expected 32'hAABBCCDD, got %h", data_out);
            $finish;
        end

        // Test case 2: Store half (sb=0, sh=1)
        data_in = 32'hAABBCCDD; // Input data
        sb = 0; 
        sh = 1; 
        #10;
        if (data_out !== 32'h0000CCDD) begin
            $display("FAIL: Test case 2 failed, expected 32'h0000CCDD, got %h", data_out);
            $finish;
        end

        // Test case 3: Store byte (sb=1, sh=0)
        data_in = 32'hAABBCCDD; // Input data
        sb = 1; 
        sh = 0; 
        #10;
        if (data_out !== 32'h000000DD) begin
            $display("FAIL: Test case 3 failed, expected 32'h000000DD, got %h", data_out);
            $finish;
        end

        // Test case 4: Default case (sb=1, sh=1)
        data_in = 32'hAABBCCDD; // Input data
        sb = 1; 
        sh = 1; 
        #10;
        if (data_out !== 32'hAABBCCDD) begin
            $display("FAIL: Test case 4 failed, expected 32'hAABBCCDD, got %h", data_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule