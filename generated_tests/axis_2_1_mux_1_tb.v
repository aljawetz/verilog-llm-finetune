`timescale 1ns/1ps

module tb_axis_2_1_mux;

    reg clk;
    reg rst;
    reg sel;
    reg [7:0] s_tdata_1_in;
    reg s_tvalid_1_in;
    wire s_tready_1_out;
    reg s_last_1_in;
    reg [7:0] s_tdata_2_in;
    reg s_tvalid_2_in;
    wire s_tready_2_out;
    reg s_last_2_in;
    wire [7:0] m_tdata_out;
    wire m_tvalid_out;
    reg m_tready_in;
    wire m_last_out;

    // Instantiate the module under test (uut)
    axis_2_1_mux uut (
        .clk(clk),
        .rst(rst),
        .sel(sel),
        .s_tdata_1_in(s_tdata_1_in),
        .s_tvalid_1_in(s_tvalid_1_in),
        .s_tready_1_out(s_tready_1_out),
        .s_last_1_in(s_last_1_in),
        .s_tdata_2_in(s_tdata_2_in),
        .s_tvalid_2_in(s_tvalid_2_in),
        .s_tready_2_out(s_tready_2_out),
        .s_last_2_in(s_last_2_in),
        .m_tdata_out(m_tdata_out),
        .m_tvalid_out(m_tvalid_out),
        .m_tready_in(m_tready_in),
        .m_last_out(m_last_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz clock
    end

    // Test sequence
    initial begin
        // Reset the DUT
        rst = 1;
        sel = 0;
        s_tdata_1_in = 8'b0;
        s_tvalid_1_in = 0;
        s_last_1_in = 0;
        s_tdata_2_in = 8'b0;
        s_tvalid_2_in = 0;
        m_tready_in = 1;

        #10;
        rst = 0; // Release reset
        #10;
        rst = 1; // Assert reset

        // Test case 1: Select input 1
        sel = 1;
        s_tdata_1_in = 8'hAA;
        s_tvalid_1_in = 1;
        s_last_1_in = 1;

        #10;
        if (s_tready_1_out) begin
            #10;
            if (m_tdata_out !== 8'hAA || m_tvalid_out !== 1 || m_last_out !== 1) begin
                $display("FAIL: Test case 1 failed");
                $finish;
            end
        end

        // Test case 2: Select input 2
        sel = 0;
        s_tdata_2_in = 8'h55;
        s_tvalid_2_in = 1;
        s_last_2_in = 1;

        #10;
        if (s_tready_2_out) begin
            #10;
            if (m_tdata_out !== 8'h55 || m_tvalid_out !== 1 || m_last_out !== 1) begin
                $display("FAIL: Test case 2 failed");
                $finish;
            end
        end

        // Test case 3: Check when both inputs are valid
        sel = 1;
        s_tdata_1_in = 8'hFF;
        s_tvalid_1_in = 1;
        s_last_1_in = 0;

        #10;
        if (s_tready_1_out) begin
            #10;
            if (m_tdata_out !== 8'hFF || m_tvalid_out !== 1 || m_last_out !== 0) begin
                $display("FAIL: Test case 3 failed");
                $finish;
            end
        end

        // Test case 4: Check with m_tready_in low
        m_tready_in = 0;
        #10;
        if (m_tvalid_out !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule