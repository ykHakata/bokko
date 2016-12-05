use 5.020;
use Calendar::Simple;
use Data::Dumper;
use utf8;
binmode STDOUT, ':encoding(UTF-8)';

# 追加したい機能
# 自動的にファイル作成からおこなう
# 初期値をコマンドラインの入力で変更できる

# 初期値の設定
my $cond = +{
    year           => 2016,
    month          => 12,
    separator_line => '*****',
    separator      => '-',
    title          => '作業記録',
    timetable      => '10:00-19:00',
    caps => [ '(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)' ],
    indent => '##',
};

# 任意のプロジェクト名を
my $PROJECT_TITLE = '';

# カレンダー構造体変更から出力まで一括で
print_data_memo($cond);

sub print_data_memo {
    my $cond = shift;

    # カレンダー構造体 基本形新規作成(Calendar::Simpleを利用)
    my $calendar = calendar( $cond->{month}, $cond->{year} );

    my $new_calendar = [ map { _get_new_week( $_, $cond ) } @{$calendar} ];

    return _print_calendar($new_calendar);
}

# １週間分
sub _get_new_week {
    my $week = shift;
    my $cond = shift;

    my $caps = $cond->{caps};

    my $new_week = [];

    while ( my ( $caps_index, $caps_value ) = each @{$caps} ) {
        push @{$new_week},
            +{
            week => $caps_value,
            day  => $week->[$caps_index],
            };
    }

    return [ map { _add_one_day( $_, $cond ) } @{$new_week} ];
}

# １日分
sub _add_one_day {
    my $week_and_day = shift;
    my $cond         = shift;

    my $week = $week_and_day->{week};
    my $day  = $week_and_day->{day};

    my $year           = $cond->{year};
    my $month          = $cond->{month};
    my $separator_line = $cond->{separator_line};
    my $separator      = $cond->{separator};
    my $title          = $cond->{title};
    my $timetable      = $cond->{timetable};
    my $indent         = $cond->{indent};

    return $day if !$day;

    $month = sprintf "%02d", $month;
    $day   = sprintf "%02d", $day;

    my $datetime = $year . $separator . $month . $separator . $day . $week;

    # ヒアドキュメントを利用する
    return <<"END_COMMENT";
$separator_line
$indent $datetime $timetable(9h)
$title

* 勤務時間:
    $datetime
    $timetable(9h)
    実働(8h)

* 作業内容:
    プロジェクト: $PROJECT_TITLE

    チケット:

* 明日以降の進捗予定:

* 気になる点等（アドバイスほしい点など）

END_COMMENT
}

sub _print_calendar {
    my $new_calendar = shift;

    my $cal_list;

    for my $week ( @{$new_calendar} ) {
    CAL_LIST:
        for my $day ( @{$week} ) {

            next CAL_LIST if !$day;

            $cal_list .= $day;
        }
    }

    return print $cal_list;
}






# 最初のカレンダー構造体
# $calendar = [
#     [undef, undef, undef, undef, undef, 1, 2 ],
#     [...],
#     [...],
#     [...],
#     [...],
# ];



# 最終的なデータの構造体
# $memo_list = [
#     [
#         undef,
#         undef,
#         undef,
#         undef,
#         undef,
#         '*****
#          ## 2014-08-01(金) 00:00-00:00
#          作業記録
#
#         ',
#         '*****
#          ## 2014-08-02(土) 00:00-00:00
#          作業記録
#
#         ',
#     ],
#     [...],
#     [...],
#     [...],
#     [...],
# ];
