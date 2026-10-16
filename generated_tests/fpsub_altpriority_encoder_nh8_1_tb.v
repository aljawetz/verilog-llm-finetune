`timescale 1ns/1ps

module tb_fpsub_altpriority_encoder_nh8;

    reg [1:0] data;
    wire q;
    wire zero;

    // Instantiate the module under test (uut)
    fpsub_altpriority_encoder_nh8 uut (
        .data(data),
        .q(q),
        .zero(zero)
    );

    initial begin
        // Test case 1: data = 2'b00
        data = 2'b00;
        #10;
        if (q !== 1'b1 || zero !== 1'b1) begin
            $display("FAIL: Test case 1 failed for data = 2'b00");
            $finish;
        end

        // Test case 2: data = 2'b01
        data = 2'b01;
        #10;
        if (q !== 1'b0 || zero !== 1'b0) begin
            $display("FAIL: Test case 2 failed for data = 2'b01");
            $finish;
        end

        // Test case 3: data = 2'b10
        data = 2'b10;
        #10;
        if (q !== 1'b1 || zero !== 1'b0) begin
            $display("FAIL: Test case 3 failed for data = 2'b10");
            $finish;
        end

        // Test case 4: data = 2'b11
        data = 2'b11;
        #10;
        if (q !== 1'b0 || zero !== 1'b0) begin
            $display("FAIL: Test case 4 failed for data = 2'b11");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule