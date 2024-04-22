import SwiftUI

struct CardView: View {
    @State var showView: Bool = false
    @State var shouldDisappear = false
    var key: String
    var value: String
    var body: some View {
        VStack {
            ZStack {
                if showView {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.secondary)
                        Text(value)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .frame(width: 300, height: 330)
                    .transition(.reverseflip)
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.blue)
                        Text(key)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .frame(width: 300, height: 330)
                    .transition(.flip)
                }
            }
            .frame(width: 300, height: 380)
            .onTapGesture {
                shouldDisappear.toggle()
                withAnimation(.easeInOut(duration: 0.6)) {
                    showView.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                        shouldDisappear = false
                    }
                }
            }
        }
        .navigationTitle("개발자 영단어")
    }
}

struct ContentView: View {
    let dictionary: [String: String] = ["accommodate": "편의를 도모하다, 공급하다, 돌보다", "accomplish": "성취하다, 다하다, 완수하다", "alter": "바꾸다, 변경하다, 개조하다", "appropriate": "적당한, 타당한, ~를 도용하다", "approximately": "대체로, 거의", "array": "배열, 정렬시키다, 배열하다", "assign": "할당하다", "attached": "덧붙여진, 첨부한", "attempt": "시도하다, 시도, 노력", "attribute": "속성, 특성, ~의 탓으로 하다", "audit": "~을 검사하다, 검사", "authentication": "입증, 인증, 확인", "authoritative": "권이있는, 믿을만한, 강압적인, 명령적인", "authority": "권한, 권위", "boundary": "한계, 경계(선), 범위", "compress": "압축하다", "compromise": "타협, 양보, 절충(안)", "confidential": "기밀의, 비밀의", "confirm": "확인하다, ~를 확실하게 하다", "confirmation": "확증, 확립", "conflict": "충돌하다, 대립하다, 충돌, 대립", "consolidate": "합병하다, 통합하다", "convergence": "집합점", "crash": "고장, 파괴", "credential": "증명서, 자격", "current": "현재의, 최신의", "damage": "손상", "dedicated": "전용의", "define": "정의하다, 설명하다", "delegate": "대표", "deploy": "배치시키다, 효율적으로 활용하다, 배치, 전개", "destination": "목적지", "disrupt": "중단시키다, 붕괴시키다", "divided": "분할된, 분리된, 분배된", "elect": "택하다, 결정하다, 선거하다", "enforce": "실시하다, 강요하다, 억지로 시키다", "enrollment": "등록, 기재", "ensure": "~을 책임지다, 확실하게 하다, 확보하다, 안전하게 하다", "establish": "설립하다, 확립하다, 증명하다", "exceed": "한도를 넘어서다, 초과하다", "exclamation": "외침, 절규", "exclustion": "제외, 배제", "exclusively": "독점적으로, 전문적으로, 오로지 ~만", "exhibit": "나타내다, 공개하다", "expedite": "~를 진척시키다, 촉진시키다", "expire": "만기가 되다, 만료되다", "explicit": "명백한, 명료한", "exposed": "노출된", "facilities": "기능, 설비, 시설", "feature": "특징, 특색", "fragment": "조각, 일부분, 붕괴시키다, 분해시키다, 세분화 시키다", "further": "더 먼, 더 앞의", "grant": "허가하다, 수여하다, 인정하다, 수여, 허가, 인가", "identical": "동일한", "idle": "비어있는, 아무것도 안하는", "implement": "수행하다, 이행하다, 도구, 기구", "improve": "향상시키다", "inappropriate": "부적당한", "indicate": "지시(지적)하다, 암시하다, ~를 나타내다", "individually": "개별적으로, 독자적 방법으로", "inheritance": "상속", "instead": "대신에, 그보다도", "instruct": "가르치다", "insufficient": "불충분한, 부족한", "integrated": "통합된, 조직화된", "intervention": "중재, 개입", "investigate": "조사하다, 탐색하다", "isolate": "~로부터 격리시키다, 분리시키다", "legacy": "유산, 기존부터 사용되어 온", "maintenance": "유지보수, 정비", "malicious": "악의 있는", "manufacturing": "제조하는, 제작하는", "notification": "통지, 통고", "numerous": "매우 많은, 무수한", "observe": "관찰하다, 감시하다", "occur": "일어나다, 생기다", "operational": "운영상의, 조작상의", "ordinary": "보통의, 평범한", "ownership": "소유권", "perform": "수행하다, 실행하다", "prevent": "예방하다, 방지하다", "priority": "우선(권)", "privilege": "특권, ~에게 특권을 주다", "procedure": "순서, 절차", "promote": "촉진하다, 장려하다, 승진시키다", "properly": "알맞게, 적당하게", "property": "속성, 성질, 특성, 소유물", "purchase": "구입하다", "queue": "줄, 대기줄", "range": "범위, 한계", "recursive": "순환적인, 반복적인, 순환의", "redundancy": "과잉, 여분", "region": "지역, 지방", "replica": "사본, 복제", "reservation": "예약, 보류", "resource": "자원, 원천", "respond": "응답하다, 대답하다", "restore": "복구하다", "restrict": "제한하다", "retain": "유지하다, 보존하다", "revert": "되돌아가다", "scope": "범위", "separate": "분리하다, 갈라놓다", "simultaneonsly": "일제히", "specification": "상술, 열거, 설계 명세서", "status": "상태, 지위, 신분", "subordinate": "하위의, 하급의", "substitute": "대리, 대신하다", "suspect": "짐작하다, 의심하다", "synchronization": "동기화", "synchronous": "동시의, 동시에 일어나는", "through": "~을 통하여, ~을 지나서", "tolerant": "관대한", "troubleshooting": "분쟁조정", "valid": "유효한, 정당한", "variable": "변수, 변하기 쉬운", "verify": "조회하다, 증명하다, 검증하다"]

    var body: some View {
        NavigationView {
            TabView {
                ForEach(dictionary.shuffled(), id: \.key) { key, value in
                    CardView(key: key, value: value)
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FlipTransition: ViewModifier, Animatable {
    var progress: CGFloat = 0
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    func body(content: Content) -> some View {
        content
            .opacity(progress < 0 ? (-progress < 0.9 ? 1 : 0) : (progress < 0.9 ? 1 : 0))
            .rotation3DEffect(
                .init(degrees: progress * 100),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
    }
}

extension AnyTransition {
    static let flip: AnyTransition = .modifier(
        active: FlipTransition(progress: 1.8),
        identity: FlipTransition()
    )
    
    static let reverseflip: AnyTransition = .modifier(
        active: FlipTransition(progress: -1.8),
        identity: FlipTransition()
    )
}
