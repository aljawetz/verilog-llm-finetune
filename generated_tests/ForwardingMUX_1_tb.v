`timescale 1ns/1ps

module tb_ForwardingMUX;

    reg [1:0] select_i;
    reg [31:0] data_i;
    reg [31:0] EX_MEM_i;
    reg [31:0] MEM_WB_i;
    wire [31:0] data_o;

    // Instantiate the module under test
    ForwardingMUX uut (
        .select_i(select_i),
        .data_i(data_i),
        .EX_MEM_i(EX_MEM_i),
        .MEM_WB_i(MEM_WB_i),
        .data_o(data_o)
    );

    initial begin
        // Test case 1: select_i = 00, expect data_o = data_i
        data_i = 32'hA5A5A5A5; 
        EX_MEM_i = 32'h5A5A5A5A; 
        MEM_WB_i = 32'h3C3C3C3C; 
        select_i = 2'b00;
        #10;
        if (data_o !== data_i) begin
            $display("FAIL: Test case 1 failed, expected %h but got %h", data_i, data_o);
            $finish;
        end

        // Test case 2: select_i = 01, expect data_o = MEM_WB_i
        select_i = 2'b01;
        #10;
        if (data_o !== MEM_WB_i) begin
            $display("FAIL: Test case 2 failed, expected %h but got %h", MEM_WB_i, data_o);
            $finish;
        end

        // Test case 3: select_i = 10, expect data_o = EX_MEM_i
        select_i = 2'b10;
        #10;
        if (data_o !== EX_MEM_i) begin
            $display("FAIL: Test case 3 failed, expected %h but got %h", EX_MEM_i, data_o);
            $finish;
        end

        // Test case 4: select_i = 11 (default case), expect data_o = data_i
        select_i = 2'b11;
        #10;
        if (data_o !== data_i) begin
            $display("FAIL: Test case 4 failed, expected %h but got %h", data_i, data_o);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule